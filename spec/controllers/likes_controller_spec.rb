#frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe LikesController, type: :controller do
    let(:user) { create :user }

    before { sign_in user }

    describe '#index' do
        let!(:post) { create :post, user: user }
        let!(:like) { create :like, user: user, post: post}
        let(:params) { { post_id: post.id } }
        
        subject { get :index, params: params }

        it 'assigns @likes' do
            subject
            expect(assigns(:users)).to eq([user])
        end

        it { is_expected.to render_template('index') }
    end

    describe '#create' do
        let!(:post) { create :post, user: user }
        let(:params) { { post_id: post.id } }

        subject { process :create, method: :post, params: params }
        it 'create likes' do
            expect { subject }.to change { Like.count }.by(1)
            is_expected.to redirect_to(user_post_path(user, assigns(:post)))
        end
    end

    describe '#destroy' do
        let!(:post) { create :post, user: user }
        let!(:like) { create :like, user: user, post: post }
        let(:params) { { post_id: post.id, id: like.id } }

        subject { process :destroy, method: :delete, params: params }
        it 'destroy likes' do
            expect { subject }.to change { Like.count }.by(-1)
            is_expected.to redirect_to(user_post_path(user, assigns(:post)))
        end
    end
end