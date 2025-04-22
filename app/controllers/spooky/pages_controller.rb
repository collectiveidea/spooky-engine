module Spooky
  class PagesController < ApplicationController
    def index
      @pages, @pagination = ghost.pages(
        include: "authors,tags",
        filter: "visibility:public",
        page: params[:page].presence,
        limit: params[:limit].presence
      )

      render_404 unless @pages
    end

    def show
      @page = ghost.page_by(slug: params[:id])
      render_404 unless @page
    end
  end
end
