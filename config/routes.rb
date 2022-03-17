Rails.application.routes.draw do
  devise_for :users
  resources :categories do 
    resources :invoices
  end
  resources :users , except: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
