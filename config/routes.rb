Rails.application.routes.draw do

  root 'pages#show', page: "home"

  get "pages/:page" => "pages#show"

  devise_for :users
  resources :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
