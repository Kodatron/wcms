Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sv/ do
    resources :users
    root :to => "pages#index"
  end
end
