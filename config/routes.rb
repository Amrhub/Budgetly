Rails.application.routes.draw do
  devise_for :users
  resources :invoices
  resources :users , except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "invoices#index"
end
