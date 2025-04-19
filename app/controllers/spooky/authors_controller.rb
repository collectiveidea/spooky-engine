module Spooky
  class AuthorsController < ApplicationController
    def index
      @authors, @pagination = ghost.authors(include: "count.posts")
    end

    def show
      @page = ghost.author_by(slug: params[:id])
      render_404 unless @page
    end
  end
end
