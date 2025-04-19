module Spooky
  class AuthorsController < ApplicationController
    def index
      @authors, @pagination = ghost.authors(include: "count.posts")
    end

    def show
      @author = ghost.author_by(slug: params[:id])
      render_404 unless @author
    end
  end
end
