Rails.application.routes.draw do
  devise_for :users
  root to: 'protections#index'
  resources :protections do
    resources :fosters, only: [:index, :create]
  end
  resources :users, only: :show
end
