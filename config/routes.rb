Rails.application.routes.draw do
  root 'welcome#index'
  resources :stations
  resources :shows
  resources :genres, only: [:index, :show, :new, :create]
  resources :channels, only: [:index, :show, :new, :create]
end
