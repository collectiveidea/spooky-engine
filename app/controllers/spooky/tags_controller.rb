module Spooky
  class TagsController < ApplicationController
    def index
      @tags, @pagination = ghost.tags(include: "count.posts", filter: "visibility:public")
    end

    def show
      @tag = ghost.tag_by(slug: params[:id])
      render_404 unless @tag
    end
  end
end
