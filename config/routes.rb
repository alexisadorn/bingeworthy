Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
    resources :shows, only: [:index]
  end
  resources :stations do
    resources :shows, only: [:show]
  end
  resources :shows
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]
  get '/edit_my_show/:id', to: 'station_shows#edit', as: 'edit_my_show'
  patch '/edit_my_show/:id', to: 'station_shows#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
