module SpookyEngine
  module ApplicationHelper
    # Simplify path generation
    def spooky_pagination_path(options)
      spooky_engine.url_for(params.permit(:page, :limit).merge(options))
    end
  end
end
