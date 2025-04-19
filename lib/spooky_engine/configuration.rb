# frozen_string_literal: true

module SpookyEngine
  class Configuration
    # Title used in Atom feed. Defaults to "#{Rails.application.name.titleize} Blog"
    attr_accessor :title

    # Optional values used in Atom feed. Defaults to nil
    attr_accessor :subtitle
    attr_accessor :icon
    attr_accessor :logo
    attr_accessor :rights

    def initialize
      @title = "#{Rails.application.name.titleize} Blog"
    end
  end
end
