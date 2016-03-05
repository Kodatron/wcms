Rails.application.routes.draw do
  resources :alts
  resources :profiles
  resources :users
  resources :pages
  resources :account_activations, only: [:edit]
  
  get 'sessions/new'

  root :to => "pages#index"
  post   '/login'   => 'sessions#create'
  get    '/login'   =>  'sessions#new'
  delete '/logout'  => 'sessions#destroy'
  get 'about_us' => 'pages#about_us', as: :about
  get 'dashboard' => 'pages#dashboard', as: :dashboard
  get '/profile/:name/settings' => 'users#settings', as: :settings

  namespace :admin do
    get :index
    get :blog
    get :news
    get :users
    get :applications
    get :alt_requests
  end

  resources :alt_requests do
    post :approve_or_decline
  end

  resources :guild_applications do
    post :approve_or_decline
  end

  resources :news do
    get :change_status
  end

  resources :posts do
    get :change_status, as: :change_status
  end
end
