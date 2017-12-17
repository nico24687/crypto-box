Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do 
    resources :cryptocurrencies
  end 
  namespace :admin do 
    resources :categories, only: ['index']
  end 
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
