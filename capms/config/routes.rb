Rails.application.routes.draw do


  resources :users
  resources :groups

  root 'pages#index'

  # root 'users#index'
end
