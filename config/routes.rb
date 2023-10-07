Rails.application.routes.draw do
  devise_for :users
  root to: 'protections#index'
  resources :protections
end
