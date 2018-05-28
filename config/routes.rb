Rails.application.routes.draw do
  root 'welcome#index'
  resources :stations
  resources :shows
  resources :genres, only: [:index, :show, :new, :create]
  resources :channels, only: [:index, :show, :new, :create]
  get '/signup', to: 'users#new', as: 'new_user'
  post '/signup', to: 'users#create'
  get '/users', to: 'users#index'
end
