#frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe CommentsController, type: :controller do
    let(:user) { create :user }

    before{ sign_in user}

    describe '#create' do 
        let!(:post) { create :post, user: user }
        let(:params) do
            {
                username: user.name,
                post_id: post.id,
                comment: attributes_for(:comment)
            }
        end

        subject { process :create, method: :post, params: params }

        it 'create comment' do
            expect { subject }.to change { Comment.count }.by(1)
            is_expected.to redirect_to(user_post_path(user, assigns(:post)))
        end

        context 'when params invalid' do
            let(:params) do
                {
                    username: user.name,
                    post_id: post.id,
                    comment: { body: nil }
                }
            end

            it 'create comment' do 
                expect { subject }.not_to change { Comment.count } 
                is_expected.to redirect_to(user_post_path(user, assigns(:post)))
            end
        end

        context 'when user comments elses user posts' do
            let(:params) do
                {
                    username: user.name,
                    post_id: post.id,
                    comment: { body: 'Body' }
                }
            end

            subject { process :create, method: :post, params: params }

            it 'create comment' do
                expect { subject }.to change { Comment.count }.by(1)
                is_expected.to redirect_to(user_post_path(user, assigns(:post)))
            end
        end
    end

    describe '#destroy' do
        let!(:post) { create :post, user: user }
        let!(:comment) { create :comment, username: user.name, post: post}

        let(:params) { { post_id: post.id, id: comment.id } }

        subject { process :destroy, method: :delete, params: params }

        it 'destroy comment' do
            expect { subject }.to change { Comment.count }.by(-1)
            is_expected.to redirect_to(user_post_path(user, assigns(:post)))
        end
    end

end