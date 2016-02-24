Rails.application.routes.draw do
  resources :alts
  resources :profiles
  resources :users
  resources :pages
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
