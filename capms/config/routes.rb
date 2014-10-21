Rails.application.routes.draw do


  

  get 'flatuipro_demo/index'

  devise_for :users
  resources :users
  resources :groups
  resources :teams

  root 'pages#index'

  # root 'users#index'
end
