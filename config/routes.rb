Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    get 'shows/behind', to: 'shows#behind'
    resources :watchlists
    resources :shows, only: [:index]
  end
  resources :watchlists
  resources :listings, only: [:destroy]
  resources :shows do
    resources :listings, except: [:index, :destroy]
  end
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]
  get '/auth/google/callback', to: 'users#google_login'
  get '/search', to: 'shows#search'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
