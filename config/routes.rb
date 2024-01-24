Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'
  root to: "comments#index"
end
