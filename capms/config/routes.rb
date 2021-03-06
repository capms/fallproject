Rails.application.routes.draw do

  get 'message_board', to: 'message_board#index', as: 'message_board'

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"


  get 'flatuipro_demo/index'

  # devise_for :users
  Rails.application.routes.draw do
  get 'message_board/index'

      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
    end
  resources :users do
    collection do
      put 'team_change', :action => :change_team
      put 'team_leave', :action => :leave_team
    end
  end

  resources :groups
  resources :teams
  resources :messages do
    resources :comments
  end
  resources :notifications
  resources :bulletins do
    member do
      post 'bulls_gen', :action => :gen_after_msg
      delete 'msg_bulls_des', :action => :destroy_msg_bull
      post 'publish_request', :action => :publish_request
      delete 'publish_agree', :action => :publish_agree
      delete 'publish_decline', :action => :publish_decline
    end
  end
  resources :acceptable_users


  root 'pages#index'

  # root 'users#index'
end
