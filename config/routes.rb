Rails.application.routes.draw do
  # rooms
  root 'rooms#index'
  resources :rooms
end
