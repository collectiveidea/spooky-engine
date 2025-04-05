module GhostEngine
  module Manage
    class PostsController < GhostEngine::ApplicationController
      def index
        @posts = Post.order(published_at: :desc).page(params[:page]).per(10)
      end

      def show
        @post = Post.find(params[:id])
      end

      def new
        @post = Post.new
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          redirect_to manage_post_path(@post), notice: "Post was successfully created."
        else
          render :new
        end
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to manage_post_path(@post), notice: "Post was successfully updated."
        else
          render :edit
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to manage_posts_path, notice: "Post was successfully deleted."
      end

      private

      def post_params
        params.expect(post: [:title, :slug, :body, :published_at, :author_ids])
      end
    end
  end
end
