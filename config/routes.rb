Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "stripe/charge" => "stripe#process_payment"
  get ":page" => "pages#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
