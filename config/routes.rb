Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :profiles
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :settings, except: [:show]

  get 'sessions/new'

  root :to => "pages#index"
  post   '/login'   => 'sessions#create'
  get    '/login'   =>  'sessions#new'
  delete '/logout'  => 'sessions#destroy'
  get 'about_us' => 'pages#about_us', as: :about
  get 'dashboard' => 'pages#dashboard', as: :dashboard

  namespace :pages do
    get :about_us
    get :dashboard
    get :guild
  end

  namespace :admin do
    get :index
    get :blog
    get :news
    get :users
    get :applications
    get :alt_requests
    get :servers
  end

  resources :alts do
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

  get 'settings/:tab' => 'settings#edit', as: :user_settings, :constraints => {:tab => /settings|user|profile|alts|alt_requests|twitch/ }, :defaults => {:tab => 'settings'}

end
