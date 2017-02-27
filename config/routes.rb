Rails.application.routes.draw do
  
  get "sessions/new"
  get "static_pages/home"
  get "static_pages/about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root "static_pages#home"

  resources :users
end
