module Spooky
  class AuthorsController < ApplicationController
    def index
      @authors, @pagination = ghost.authors(
        include: "count.posts",
        filter: "visibility:public",
        page: params[:page].presence,
        limit: params[:limit].presence
      )

      render_404 unless @authors
    end

    def show
      @author = ghost.author_by(slug: params[:id])
      render_404 unless @author
    end
  end
end
