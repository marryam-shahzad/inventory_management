Rails.application.routes.draw do
  resources :stores
  resources :products
  
  root to: 'products#index'
end
