Rails.application.routes.draw do
  resources :users
  resources :pages

  root :to => "pages#index"

  get 'about_us' => 'pages#about_us', as: :about

  resources :posts do
    get :change_status, as: :change_status
  end

  namespace :admin do
    get :index
    get :blog
  end
end
