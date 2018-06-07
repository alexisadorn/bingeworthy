Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create, :show] do
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
