QuickBlog::Engine.routes.draw do
  namespace :manage do
    resources :posts
  end

  root to: "posts#index"
end
