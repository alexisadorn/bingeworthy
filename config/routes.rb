Rails.application.routes.draw do
  root 'welcome#index'
  resources :stations
  resources :shows
  resources :genres
  resources :channels
  resources :station_shows
  get '/signup', to: 'users#new', as: 'new_user'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
