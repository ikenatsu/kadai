Rails.application.routes.draw do
  get 'comments/index'
  root to: "comments#index"
end
