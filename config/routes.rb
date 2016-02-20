Rails.application.routes.draw do
  resources :profiles
  resources :users
  resources :pages

  root :to => "pages#index"

  get 'about_us' => 'pages#about_us', as: :about

  namespace :admin do
    get :index
    get :blog
    get :news
    get :users
    get :applications
  end

  resources :guild_applications do
    get :approve
    get :decline
  end

  resources :news do
    get :change_status
  end

  resources :posts do
    get :change_status, as: :change_status
  end
end
