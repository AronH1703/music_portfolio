Rails.application.routes.draw do
  get 'gallery/index'
  get 'home/index'
  get 'pages/home'

  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'home#index' # Home page

  get '/gallery', to: 'gallery#index', as: :gallery
  get '/newsletter', to: 'newsletter_subscribers#new', as: :newsletter
post '/newsletter', to: 'newsletter_subscribers#create'

  # Use RESTful routes for videos
  resources :videos, only: [:index, :show]
end
