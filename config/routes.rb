Rails.application.routes.draw do

  get "static_pages/home"
  get "static_pages/about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root "activities#index"

  resources :users
  resources :books
  resources :reviews
  resources :comments
  resources :marks, except: [:index]
  resources :activities
  resources :requests, except: [:index]
  resources :relationships, only: [:create, :destroy]

  resources :users do
    resources :requests, only: [:index]
    resources :marks, only: [:index]
    resources :following, only: [:index]
    resources :followers, only: [:index]
  end

  namespace :admin do
    root "admin#index"
    resources :categories
    resources :books
    resources :users
    resources :requests, except: [:show]
  end
end
