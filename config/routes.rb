Rails.application.routes.draw do
  resources :users
  get 'xlsx/tojson'
  get 'csv/tojson'
  get 'applicants/savedata'
  resources :reviews
  resources :users
  resources :candidates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :candidates
  # Defines the root path route ("/")
  # root "articles#index"
  get '/auth/google_oauth2/callback', to: 'sessions#create', via: [:get, :post]
  get '/logout', to: 'sessions#destroy'
  get "/candidates", to: "candidates#index"
  get "/users", to: "users#index"
  get "/reviews", to: "reviews#index"
  get '/home', to: 'homepage#index'
  post '/login', to: 'welcome#create'
  get '/searches', to: 'searches#index'

  root 'welcome#index'
end
