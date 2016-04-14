Rails.application.routes.draw do



  get 'tickets/new'

  get 'tickets/create'

  get 'charges/create'

 resources :attendees, only: [:new, :create]
#

  resources :events, only: [:index, :show] do
    resources :tickets, only: [:new, :create]
  end
  
  root to: 'events#index'


  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :admin, only: [:show]
    resources :events

    resources :attendees

    root to: "sessions#new"
  end
end
