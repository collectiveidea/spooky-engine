module SpookyEngine
  class PostsController < ApplicationController
    def index
      @posts, @pagination = ghost.posts(include: "authors,tags")

      respond_to do |format|
        format.html
        format.atom
      end
    end

    def show
      @post = ghost.post_by(slug: params[:id])
      render_404 unless @post
    end
  end
end
