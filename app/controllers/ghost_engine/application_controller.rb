module GhostEngine
  class ApplicationController < ActionController::Base
    private

    def ghost
      @ghost ||= Spooky::Client.new
    end

    def render_404
      render file: Rails.public_path.join("404.html"), layout: false
    end
  end
end
