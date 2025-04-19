# frozen_string_literal: true``

require "spooky"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem_extension(Spooky)
loader.setup

module Spooky
  ENGINE_VERSION = "0.1.0"
  class Engine < ::Rails::Engine
    isolate_namespace Spooky
    engine_name "spooky-engine_blog"

    config.spooky_engine = Spooky::EngineConfiguration.new
  end
end

loader.eager_load
