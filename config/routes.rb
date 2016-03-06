Rails.application.routes.draw do
  resources :servers
  resources :alts
  resources :profiles
  resources :users
  resources :pages
  resources :settings, except: [:show]

  get 'sessions/new'

  root :to => "pages#index"
  post   '/login'   => 'sessions#create'
  get    '/login'   =>  'sessions#new'
  delete '/logout'  => 'sessions#destroy'
  get 'about_us' => 'pages#about_us', as: :about
  get 'dashboard' => 'pages#dashboard', as: :dashboard

  namespace :admin do
    get :index
    get :blog
    get :news
    get :users
    get :applications
    get :alt_requests
    get :servers
  end

  resources :alt do
    get :new
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

  resources :servers, only: [:index]

  get 'settings/:tab' => 'settings#edit', as: :user_settings, :constraints => {:tab => /settings|user|profile|alts|password|twitch/ }, :defaults => {:tab => 'settings'}

end
