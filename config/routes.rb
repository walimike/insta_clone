Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, defaults: { format: 'json' } do
    resources :users, :posts
  end
  # IMPORTANT #
  # This `match` must be the *last* route in routes.rb
  match '*path', to: 'pages#index', via: :all
end