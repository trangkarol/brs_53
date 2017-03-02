Rails.application.routes.draw do

  get "static_pages/home"
  get "static_pages/about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root "static_pages#home"

  resources :users

  namespace :admin do
    root "admin#index"
    resources :categories
  end
end
