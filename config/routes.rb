Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :shop do 
    resources :products
  end

  resources :orders

  resources :categories
  
  post 'add_to_cart/:id' => 'orders#add_to_cart', as: 'add_to_cart'
  get 'products/search' => 'products#search'
  get '/products' => 'products#index'
  get "stripe/charge" => "stripe#process_payment"
  get ":page" => "pages#show"

end
