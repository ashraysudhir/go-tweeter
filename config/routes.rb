Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contactus', to: 'static_pages#contactus'
  get  '/about',   to: 'static_pages#about'
end
