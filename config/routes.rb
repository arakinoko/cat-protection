Rails.application.routes.draw do
  devise_for :users
  root to: 'protections#index'
  resource :protections, only: [:index, :new, :create]
end
