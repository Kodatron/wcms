Rails.application.routes.draw do
  scope "(:locale)", locale: /en|sv/ do
    resources :users
    get '' => "pages#index"
  end
end
