Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  resources :users, only: [:show]
  resources :posts, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
end
