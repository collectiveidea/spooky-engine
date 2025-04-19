module GhostEngine
  class Engine < ::Rails::Engine
    isolate_namespace GhostEngine
    engine_name "ghost_engine"

    config.ghost_engine = Configuration.new
  end
end
