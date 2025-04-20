# frozen_string_literal: true

module Spooky
  class EngineConfiguration
    # Title used in Atom feed. Defaults to "#{Rails.application.name.titleize} Blog"
    attr_writer :title

    # Optional values used in Atom feed. Defaults to nil
    attr_accessor :subtitle
    attr_accessor :icon
    attr_accessor :logo
    attr_accessor :rights

    def title
      self.title = "#{Rails.application.name.titleize} Blog"
    end

    def config
      yield self if block_given?
    end
  end
end
