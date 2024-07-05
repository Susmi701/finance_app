require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, only: [:create , :destroy]
  resources :friendships, only: [:create , :destroy]
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'quote', to: 'stocks#quote'
  get 'search_friend', to: 'users#search'
  get 'friends', to: 'users#my_friends'
  
 
  resources :users, only: [:show]
   root 'stocks#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  mount Sidekiq::Web => '/sidekiq'
end
