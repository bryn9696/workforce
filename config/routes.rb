Rails.application.routes.draw do
  resources :organisations
  get 'home/index'
  root 'home#index'
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]
end
