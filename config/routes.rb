Rails.application.routes.draw do


  root 'pages#index'
  get 'pages/help'
  get 'pages/link'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :topics do
    resources :comments, only: [:new, :create]
  end 
  resources :comments, only: [:destroy]

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'


 
end
