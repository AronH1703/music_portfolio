Rails.application.routes.draw do
  # Devise admin authentication (mounted at /admin). Disable public sign-up but allow edit/update.
  devise_for :admin_users, path: 'admin', skip: [:registrations], controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }
  devise_scope :admin_user do
    get  'admin/edit', to: 'admin/registrations#edit', as: :edit_admin_user_registration
    put  'admin',      to: 'admin/registrations#update', as: :admin_user_registration
    patch 'admin',     to: 'admin/registrations#update'
  end
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

  get '/privacy', to: 'pages#privacy', as: :privacy

  # Add route for songs
  get '/songs/:song', to: 'songs#show', as: 'song'

  # Lightweight Admin namespace
  namespace :admin do
    root to: 'dashboard#index'
    resources :songs
    resources :videos
    resources :newsletter_subscribers, only: [:index, :destroy] do
      collection do
        get :emails # text page with copy/paste list
        get :export, defaults: { format: :csv }
      end
    end
  end
end
