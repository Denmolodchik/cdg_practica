class LikesController < ApplicationController


    def index
        @post = Post.find(params[:post_id])
        @likes = Like.where(post_id: @post.id)
        @users_like = @likes.map(&:user_id)

        @users = User.select{|user| @users_like.include? user.id}
    end

    def create
        @post = Post.find(params[:post_id])
        @like  = Like.new(user_id: current_user.id, post_id: @post.id)
        @like.save
        redirect_to user_post_path(current_user,@post)
    end

    def destroy
        @user = current_user
        @post = Post.find(params[:post_id])

        Like.where(user_id: @user.id, post_id: @post.id).destroy_all

        redirect_to user_post_path(@user,@post)
    end
end
