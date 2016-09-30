Rails.application.routes.draw do
  root to: 'notes#index'
  resources :users, only: [:create]
  resources :notes
  resources :sessions, only: [:create]
end
