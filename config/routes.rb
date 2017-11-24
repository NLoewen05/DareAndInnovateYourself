Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'products/search' => 'products#search'

  resources :shop do 
    resources :products
  end

  resources :categories

  get "stripe/charge" => "stripe#process_payment"
  get ":page" => "pages#show"

end
