Rails.application.routes.draw do
  get 'contact/index'
  get 'videos/index'
  get 'gallery/index'
  get 'home/index'
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'home#index' # Home page

  get '/gallery', to: 'gallery#index', as: :gallery
  get '/videos', to: 'videos#index', as: :videos
  get '/contact', to: 'contact#index', as: :contact



  # Defines the root path route ("/")
  # root "posts#index"
end
