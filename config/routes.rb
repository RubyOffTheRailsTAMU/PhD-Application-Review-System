Rails.application.routes.draw do
  get 'xlsx/tojson'
  get 'csv/tojson'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :candidates
  # Defines the root path route ("/")
  # root "articles#index"
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get "/candidates", to: "candidates#index"
  root 'welcome#index'
end
