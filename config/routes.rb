Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: { format: 'json' } do
    resources :users, :posts
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  match '*path', to: 'pages#index', via: :all
end