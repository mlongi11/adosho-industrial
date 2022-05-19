Rails.application.routes.draw do
  resources :breeds
  resources :interests
  devise_for :users
  root to: "home#index"

end
