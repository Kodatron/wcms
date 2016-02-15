Rails.application.routes.draw do
  resources :profiles
  resources :users
  resources :pages

  root :to => "pages#index"

  get 'about_us' => 'pages#about_us', as: :about

  resources :posts do
    get :change_status, as: :change_status
  end

  resources :news do
    get :change_status
  end

  namespace :admin do
    get :index
    get :blog
    get :news
  end
end
