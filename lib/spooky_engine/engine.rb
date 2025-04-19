module SpookyEngine
  class Engine < ::Rails::Engine
    isolate_namespace SpookyEngine
    engine_name "spooky_engine"

    config.spooky_engine = Configuration.new
  end
end
