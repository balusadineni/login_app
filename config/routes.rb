Rails.application.routes.draw do
  get 'sessionss/create'

  get 'sessionss/destroy'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

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

  get 'auth/:provider/callback', to: 'sessionss#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessionss#destroy', as: 'signout'

  get '/welcome', to: 'static_pages#welcome'

  resources :sessionss, only: [:create, :destroy]
  resource :home, only: [:show]

end
