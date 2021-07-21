#frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe FollowsController, type: :controller do
    let(:follower) { create :user }

    before { sign_in follower }

    describe '#create' do
        let!(:following) { create :user }
        let(:params) { { following_id: following.id } }

        subject { process :create, method: :post, params: params }

        it 'create follows' do
            expect { subject }.to change { Follow.count }.by(1)
            is_expected.to redirect_to(user_followings_path(follower))
        end
    end

    describe '#destroy' do
        let!(:following) {create :user}
        let!(:follow) { create :follow, follower: follower, following: following }
        let(:params) { { id: following.id } }

        subject { process :destroy, method: :delete, params: params }

        it 'destroy likes' do
            expect { subject }.to change { Follow.count }.by(-1)
            is_expected.to redirect_to(user_followings_path(follower))
        end

    end
end