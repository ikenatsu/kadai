Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'
  root to: "comments#index"
  resources :users, only: [:edit, :update]
  resources :problems, only: [:new, :create]
end
