Rails.application.routes.draw do
  # Update Music route to point to MusicController instead of PagesController
  get '/music', to: 'music#index', as: :music

  # Keep gallery and home routes
  get '/gallery', to: 'gallery#index', as: :gallery
  get '/home', to: 'home#index', as: :home

  # Rails health check (keep this)
  get "up" => "rails/health#show", as: :rails_health_check

  # Define the homepage
  root to: 'home#index' # Home page

  # Newsletter subscription routes
  get '/newsletter', to: 'newsletter_subscribers#new', as: :newsletter
  post '/newsletter', to: 'newsletter_subscribers#create'

  # RESTful routes for videos
  resources :videos, only: [:index, :show]

  # Add routes for contact
  get '/contact', to: 'contact#index', as: :contact

  # Add route for pages/music
  get 'pages/music', to: 'pages#music', as: 'pages_music'
end
