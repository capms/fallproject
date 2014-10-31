Rails.application.routes.draw do

  get 'flatuipro_demo/index'

  # devise_for :users
  Rails.application.routes.draw do
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    end
  resources :users
  resources :groups
  resources :teams

  root 'pages#index'

  # root 'users#index'
end
