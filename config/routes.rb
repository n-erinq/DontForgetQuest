Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "static_pages#top"
  get 'guide', to: 'static_pages#guide'
  get 'terms', to: 'static_pages#terms'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'congratulations', to: 'static_pages#congratulations'
  post 'check_records/weather', to: 'check_records#weather'

  resources :users, :only => [:show]
  resources :treasure_boxes
  resources :check_lists
  resources :check_records
end
