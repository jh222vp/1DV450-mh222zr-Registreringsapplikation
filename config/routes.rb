Keyholder::Application.routes.draw do
  resources :users

  root to: "sessions#new"

  get "keys", to: "keys#show", as: :key

  post "login",         to: "sessions#create",  as: :login
  get  "logout",        to: "sessions#destroy", as: :logout
  get  "users/destroy", to: "users#destroy",    as: :users_destroy
end
