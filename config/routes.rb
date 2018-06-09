Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: 'shows#search'
  resources :users do
    resources :watchlists
    resources :shows, only: [:index]
    get 'shows/behind', to: 'shows#behind'
  end
  resources :watchlists
  resources :listings, except: [:index]
  resources :shows do
    resources :listings, except: [:index]
  end
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
