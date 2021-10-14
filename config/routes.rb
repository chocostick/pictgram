Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  get 'pages/index' 
  root 'pages#index'
  get 'pages/help'
  get 'pages/link'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'


end
