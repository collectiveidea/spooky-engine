module GhostEngine
  class PostsController < ApplicationController
    def index
      @posts = Post.order(published_at: :desc).page(params[:page]).per(10)

      respond_to do |format|
        format.html
        format.atom
      end
    end
  end
end
