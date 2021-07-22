class PostsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
    before_action :load_user

    def all 
        @posts = Post.all.order(updated_at: :desc)
    end

    def index 
        @user = User.find(params[:user_id])
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
        @post.user = @user
        if @post.save
            redirect_to user_post_path(@user, @post), flash: { success: "Post was added"}
        else
            render :new, flash: {alert: "Some error occured"}
        end
    end

    def edit
        @post = @user.posts.find(params[:id])
    end

    def update
        @post = @user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to user_post_path(@user, @post), flash: { success: "Post was updated"}
        else
            render :new, flash: { alert: 'Some error occured' }
        end
    
    end

    def destroy
        @post = @user.posts.find(params[:id])
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
