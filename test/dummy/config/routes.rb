Rails.application.routes.draw do
  mount GhostEngine::Engine => "/ghost_engine"
end
