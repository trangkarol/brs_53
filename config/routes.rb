Rails.application.routes.draw do

  get "static_pages/home"
  get "static_pages/about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root "books#index"

  resources :users
  resources :books
  resources :reviews
  resources :comments
  resources :marks

  namespace :admin do
    root "admin#index"
    resources :categories
    resources :books
    resources :users
    resources :requests, except: [:show]
  end
end
