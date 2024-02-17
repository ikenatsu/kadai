Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'
  root to: "problems#index"
  resources :users, only: [:edit, :update]
  resources :problems, only: [:new, :create, :destroy] do
    resources :comments, only: [:index, :create]
  end
end
