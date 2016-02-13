Rails.application.routes.draw do

  resources :users, :pages, :posts

  scope "(:locale)", locale: /en|sv/ do

    root :to => "pages#index"
    get 'about_us' => 'pages#about_us', as: :about

    namespace :admin do
      get :index
      get :blog
    end
  end
end
