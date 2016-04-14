Rails.application.routes.draw do



  get 'charges/create'

 resources :attendees, only: [:new, :create] 
#    resources :tickets, only: [:new, :create]
#  end

  resources :events, only: [:index, :show]
  root to: 'events#index'


  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :admin, only: [:show]
    resources :events

    resources :attendees

    root to: "sessions#new"
  end
end
