Rails.application.routes.draw do
  resources :user_stocks, only: [:create , :destroy]
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'stock_symbols', to: 'stocks#stock_symbols'
  get 'quote', to: 'stocks#quote'
  get 'search', to: 'stocks#search'
  
  devise_for :users
   root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
