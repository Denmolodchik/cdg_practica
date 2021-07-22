class CommentsController < ApplicationController

    before_action :authenticate_user!
    before_action :load_post

    def create
        @body = params.require(:comment).values
        @comment = @post.comments.create(username: current_user.name, body: @body)
        redirect_to user_post_path(current_user, @post)
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to user_post_path(current_user, @post)
    end

    private

    def load_post
        @post = Post.find(params[:post_id])
    end
end
