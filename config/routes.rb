Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
    resources :shows, only: [:index]
  end
  resources :stations do
    resources :shows, only: [:show, :new, :edit]
  end
  resources :shows
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]

  # resources :station_shows, only: [:new, :create, :edit, :udpate]
  delete '/station_shows', to: 'station_shows#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
