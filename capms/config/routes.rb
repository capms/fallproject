Rails.application.routes.draw do

  get 'message_board', to: 'message_board#index', as: 'message_board'

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  get 'flatuipro_demo/index'

  devise_for :users
  resources :users
  resources :groups
  resources :teams
  resources :message_board

  root 'pages#index'

  # root 'users#index'
end
