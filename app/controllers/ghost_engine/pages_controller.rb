module GhostEngine
  class PagesController < ApplicationController
    def index
      @pages, @pagination = ghost.posts(include: "authors,tags")
    end
  
    def show
      @page = ghost.page_by(slug: params[:id])
      render_404 unless @page
    end
  end
end
