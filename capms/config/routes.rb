Rails.application.routes.draw do


  get 'flatuipro_demo/index'

  devise_for :users
  resources :users
  resources :groups

  root 'pages#index'

  # root 'users#index'
end
