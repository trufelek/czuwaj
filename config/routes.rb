Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do
    resources :users
    resources :roles
  end

  resources :magazines
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root to: "magazines#index"

end
