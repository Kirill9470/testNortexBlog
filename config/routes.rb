Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :posts, only: [:index, :create]
  resources :evaluations, only: [:create]
  resources :ip_addresses, only: [:index]
end
