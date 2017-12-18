Rails.application.routes.draw do
  root  'welcome#index' 
  
  resources :users, only: [:new, :create, :show] do 
    resources :cryptocurrencies
  end 
  namespace :admin do 
    resources :categories
  end 
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
