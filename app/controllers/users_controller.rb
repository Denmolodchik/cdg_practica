class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:index]

    def index
        @users = User.all.order(created_at: :desc)
    end

    def show
        @user = User.find(params[:id])
    end
end
