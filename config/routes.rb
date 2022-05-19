Rails.application.routes.draw do
  resources :list_of_breeds
  resources :breeds
  resources :interests
  devise_for :users
  root to: "home#index"

end
