Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :users, only: [:new, :create]

  resources :athletes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :progresses, only: [:index]
    
  resources :movements, only: :show
  get "/api_ninjas", to: "api_ninjas#index"
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
end
