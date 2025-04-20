# frozen_string_literal: true

require "spooky"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem_extension(Spooky)
loader.setup

module Spooky
  class Engine < ::Rails::Engine
    VERSION = "0.1.0"
    # isolate_namespace Spooky
    engine_name "spooky-engine"

    config.spooky_engine = Spooky::EngineConfiguration.new
  end
end

loader.eager_load
