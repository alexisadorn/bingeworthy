Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :watchlists
    resources :shows, only: [:index]
  end
  resources :watchlists
  resources :listings, except: [:index]
  resources :shows do
    resources :listings, only: [:new, :create, :edit, :update]
  end
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
