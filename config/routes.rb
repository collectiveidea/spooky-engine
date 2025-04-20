# frozen_string_literal: true

Spooky::Engine.routes.draw do |x| 
  scope module: :spooky do
    resources :authors, only: [:index, :show]
    resources :pages, only: [:index, :show]
    resources :posts, only: [:show] # index is handled by the root
    resources :tags, only: [:index, :show]
    get "feed.atom", to: "posts#index", defaults: {format: :atom}, as: :atom
    root to: "posts#index"
  end
end
