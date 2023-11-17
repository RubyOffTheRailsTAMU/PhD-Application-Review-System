class AdminConstraint
  def matches?(request)
    return false unless request.session[:user_token] == 'admin_token_placeholder'

    true
  end
end

Rails.application.routes.draw do
  # mount Motor::Admin => '/motor_admin'
  get 'dashboards/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'welcome#index'

  resources :tasks
  resources :users
  resources :reviews
  resources :applicants

  constraints(AdminConstraint.new) do
    mount Motor::Admin => '/motor_admin'
    get 'xlsx/tojson'
  end

  mount lambda { |_env|
          [200, { 'Content-Type' => 'text/html' }, ['<script>alert("Access Denied"); window.location.href = "/home";</script>']]
        }, at: '/motor_admin'
  get 'xlsx/tojson', to: lambda { |_env|
                           [200, { 'Content-Type' => 'text/html' }, ['<script>alert("Access Denied"); window.location.href = "/home";</script>']]
                         }
  # get 'xlsx/tojson', constraints: AdminConstraint.new
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
  get 'applicant', to: 'applicant#index'
  post '/assign', to: 'reviews#assign'
  # get '/applicants/:id', to: 'applicants#index', as: 'applicants'

  post 'searches', to: 'searches#index', as: 'search'
end
