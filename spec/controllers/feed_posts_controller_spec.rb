#frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe FeedPostsController, type: :controller do
    let(:follower) { create :user }
    let!(:post1) { create :post, user: follower }

    before { sign_in follower }

    describe 'index' do
        let!(:following) {create :user}
        let!(:post2) { create :post, user: following }

        subject { get :index }

        context 'when the user is not subscribed' do

            it 'assigns @feeds' do
                subject
                expect(assigns(:feeds)).to eq([post1, post2])
            end
        end

        context 'when the user is subscribed' do

            let!(:follow) { create :follow, follower: follower, following: following }

            it 'assigns @feeds' do
                subject
                expect(assigns(:feeds)).to eq([post2])
            end
        end
    
    end


end
