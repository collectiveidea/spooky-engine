QuickBlog::Engine.routes.draw do
  namespace :manage do
    resources :posts
  end

  resources :posts, only: [:show]
  get "feed.atom", to: "posts#index", defaults: { format: :atom }, as: :atom
  root to: "posts#index"
end
