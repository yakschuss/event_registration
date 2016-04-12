Rails.application.routes.draw do



  resources :attendees, only: [:new, :create] do
    resources :tickets, only: [:new, :create]
  end

  get 'events/index'
  root to: 'events#index'





  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :admin, only: [:show]
    resources :events
    resources :attendees

    root to: "sessions#new"
  end
end
