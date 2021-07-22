#frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController, type: :controller do
    let(:user) { create :user }
    let(:params) { { id: user } }

    before { sign_in user }

    describe '#index' do
        subject { get :index, params: params }

        it 'assigns @users' do
            subject
            expect(assigns(:users)).to eq([user])
        end

        it { is_expected.to render_template('index') }
    end

    describe '#show' do
        let(:params) { { id: user.id } }
        subject { get :show, params: params }

        it 'assigns @user' do
            subject
            expect(assigns(:user)).to eq(user)
        end

        it { is_expected.to render_template(:show) }

        context 'when a user is watching another user' do
            
            let!(:user) { create :user }

            it 'assigns @user' do
                subject
                expect(assigns(:user)).to eq(user)
            end
        end

    end
    
end