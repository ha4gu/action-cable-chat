Rails.application.routes.draw do
  # rooms
  root 'rooms#index'
  resources :rooms

  # devise
  devise_for :users
end
