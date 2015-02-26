Rails.application.routes.draw do

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'order_items/finish'
  get 'carts/show'
  get 'carts/checkout'
  
  devise_for :users
  devise_for :roles
  devise_for :client_orders

  scope "/admin" do
    resources :users
    resources :roles
    resources :client_orders
  end

  resources :magazines
  resources :orders
  resource :cart, only: [:show, :checkout]
  resources :order_items, only: [:create, :update, :destroy, :finish]

  root to: "magazines#index"

end
