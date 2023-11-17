# frozen_string_literal: true

Rails.application.routes.draw do
  mount Motor::Admin => '/motor_admin'
  get 'dashboards/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome#index'

  resources :tasks
  resources :users
  resources :reviews
  resources :applicants
  resources :tags

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
  # get '/applicants/:id', to: 'applicants#index', as: 'applicants'
  get 'tags/show_tags/:cas_id', to: 'tags#show_tags', as: :show_tags_for_cas

  post 'searches', to: 'searches#index', as: 'search'
end
