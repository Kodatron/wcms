Rails.application.routes.draw do
  resources :posts
  scope "(:locale)", locale: /en|sv/ do
    resources :users, :pages
    root :to => "pages#index"
    get 'about_us' => 'pages#about_us', as: :about
    get 'blog' => 'pages#blog', as: :blog
  end
end
