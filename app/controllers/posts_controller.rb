class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :user_posts]
    before_action :set_post, only: [:show, :edit, :update]
    
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to @post, notice: 'Post was successfully created.'
        else
          render :new
        end
      end
    
      def show
        @post = Post.find(params[:id])
        if user_signed_in? && current_user == @post.user
          @is_owner = true
        else
          @is_owner = false
        end
      end

      def user_posts
        @user_posts = current_user.posts
      end

      def edit
        p current_user
        p "------------------------"
        p @post
        if @post.user != current_user
          redirect_to @post, alert: 'You are not authorized to edit this post'
        else
          render :edit
        end
      end

      def update
        if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @post = Post.find(params[:id])

        if @post.user != current_user
          redirect_to @post, alert: 'You are not authorized to delete this post'
        else
          @post.destroy
          redirect_to @post, notice: 'Post was successfully deleted.'
        end
      end
    

      private
      def post_params
        params.require(:post).permit(:title, :body)
      end

      private
      def set_post
        @post = Post.find(params[:id])
      end
end
