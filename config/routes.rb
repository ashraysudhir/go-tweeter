Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  get '/contactus', to: 'static_pages#contactus'
  get  '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :tweets, only: [:create, :destroy]
end
