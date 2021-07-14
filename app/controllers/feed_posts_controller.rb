class FeedPostsController < ApplicationController
    before_action :authenticate_user!

    def index 
        if current_user.followings.exists?
            @posts = Post.where(user_id: current_user.followings.pluck(:id)).order(created_at: :desc)
        else
            @posts = Post.all
        end
    end
end
