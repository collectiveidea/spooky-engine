module Spooky
  class TagsController < ApplicationController
    def index
      @tags, @pagination = ghost.tags(include: "count.posts", filter: "visibility:public")
    end

    def show
      @page = ghost.tag_by(slug: params[:id])
      render_404 unless @page
    end
  end
end
