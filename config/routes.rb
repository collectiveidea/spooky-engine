SpookyEngine::Engine.routes.draw do
  resources :pages, only: [:index, :show]
  resources :posts, only: [:show]
  get "feed.atom", to: "posts#index", defaults: { format: :atom }, as: :atom
  root to: "posts#index"
end
