Rails.application.routes.draw do
  resources :shifts
  resources :organisations
  get 'home/index'
  root 'home#index'
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "edit", to: "users#edit"

  delete "logout", to: "sessions#destroy"
  resources :users, except: [:new]
end
