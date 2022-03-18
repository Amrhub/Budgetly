Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :invoices, except: [:index]
  get 'category_invoices/:category_name', to: 'invoices#index', as: 'category_invoices'
  resources :users , except: [:index]
  root to: 'home#index'
end
