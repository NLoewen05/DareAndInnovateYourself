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
  
  post 'addtocart/:id' => 'orders#add_to_cart', as: 'add_to_cart'
  post 'updatequantity/:id' => 'orders#update_cart_item_quantity', as: 'update_cart_item_quantity'
  delete 'deletefromcart/:id' => 'orders#delete_from_cart', as: 'delete_from_cart'
  delete 'deleteallcartitems' => 'orders#delete_all_from_cart', as: 'delete_all_from_cart'
  get 'products/search' => 'products#search'
  get '/products' => 'products#index'
  post "stripe/charge" => "stripe#process_payment"
  post "stripe/mobile_charge" => "stripe#process_mobile_payment"
  get ":page" => "pages#show"

end
