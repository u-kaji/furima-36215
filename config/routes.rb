Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :edit, :new, :create]
  resources :users, only: [:new, :create, :destroy]
end
