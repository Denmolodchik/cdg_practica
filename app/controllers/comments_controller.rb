class CommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @body = params.require(:comment).values
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(username: current_user.name, body: @body)
        redirect_to user_post_path(current_user, @post)
    end

    def destroy
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        @post = Post.find(params[:post_id])
        redirect_to user_post_path(current_user, @post)
    end

end
