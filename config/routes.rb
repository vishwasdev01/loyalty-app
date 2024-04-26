Rails.application.routes.draw do
  resources :points
  resources :user_rewards
  resources :rewards
  resources :bills
  devise_for :users
  root "users#index"
  resources :users, only: [:index]
end
