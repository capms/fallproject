Rails.application.routes.draw do


  devise_for :users
  resources :users
  resources :groups

  root 'pages#index'

  # root 'users#index'
end
