Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome#index'

  resources :tasks
  resources :users
  resources :reviews
  resources :applicants

  get 'xlsx/tojson'
  get 'csv/tojson'
  get 'applicants/savedata'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'homepage#index'
  post '/login', to: 'welcome#create'
  get '/searches', to: 'searches#index'
  get '/admin', to: 'welcome#_admin'
  get 'application', to: 'application#index'


  post 'searches', to: 'searches#index', as: 'search'
end
