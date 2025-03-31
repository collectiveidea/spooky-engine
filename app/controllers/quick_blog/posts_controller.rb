module QuickBlog
  class PostsController < ApplicationController
    def index
      @posts = Post.order(published_at: :desc).page(params[:page]).per(10)
    end
  end
end
