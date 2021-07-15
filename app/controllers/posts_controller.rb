class PostsController < ApplicationController
    
    before_action :load_user
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

    def all 
        @posts = Post.all.order(updated_at: :desc)
    end

    def index 
        @posts = Post.select{|post| post.user_id == @user.id}
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save!
            redirect_to user_post_path(@user, @post), flash: { success: "Post was added"}
        else
            render :new, flash: {alert: "Some error occured"}
        end
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to user_post_path(@user, @post), flash: { success: "Post was updated"}
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to action: :index
    end

    def post_params
        params.require(:post).permit(:title, :body, :image)
    end

    private

    def load_user
        @user = User.find(params[:user_id])
    end
end
