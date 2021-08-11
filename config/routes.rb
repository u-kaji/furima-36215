Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :destroy]
end
