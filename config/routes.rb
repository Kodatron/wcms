Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sv/ do
    resources :users, :pages
    root :to => "pages#index"
    get 'about_us' => 'pages#about_us', as: :about

    namespace :admin do
      get :index
      get :blog
    end
  end
end
