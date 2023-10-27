Rails.application.routes.draw do
  get 'dashboards/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome#index'

  resources :tasks
  resources :users
  resources :reviews
  resources :applicants

  get 'xlsx/tojson'
  get 'csv/tojson'

  # Removed the ApplicantsController
  # get 'applicants/savedata'

  resources :reviews
  resources :users
  resources :candidates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :candidates
  # Defines the root path route ("/")
  # root "articles#index"
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'homepage#index'
  post '/login', to: 'welcome#create'
  get '/searches', to: 'searches#index'
  get '/admin', to: 'welcome#_admin'
  get 'application', to: 'application#index'
  
  post 'searches', to: 'searches#index', as: 'search'
end
