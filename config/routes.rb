Rails.application.routes.draw do
  get 'events/index'
  root to: 'events#index'

  resources :admin, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :events
    resources :attendees
  end
end
