Rails.application.routes.draw do
  resources :viewers
  

  resources :notes
  root to: 'application#home'
end
