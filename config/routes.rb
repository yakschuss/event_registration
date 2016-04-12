Rails.application.routes.draw do



  get 'charges/create'

  resources :attendees, only: [:new, :create] do
    resources :tickets, only: [:new, :create]
  end

  resources :events, only: [:index, :show]
  root to: 'events#index'


  resources :charges, only: [:new, :create]


  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :admin, only: [:show]
    resources :events
    resources :attendees

    root to: "sessions#new"
  end
end
