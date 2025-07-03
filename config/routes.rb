Rails.application.routes.draw do
  devise_for :users
  resources :menu_items
  resources :orders do
    resources :order_items
  end
  resources :rooms
  resources :bookings
  resources :reviews, only: [:create, :index]
  resources :tables, only: [:show]
  root "menu_items#index"
end
