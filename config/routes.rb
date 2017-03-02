Rails.application.routes.draw do
  get 'sessions/new'

  get 'customers/new'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'customers#new'
  post '/signup',  to: 'customers#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources  :customers
end
