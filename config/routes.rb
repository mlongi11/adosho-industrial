Rails.application.routes.draw do
  resources :matches
  resources :pet_breeds
  resources :breed_webs
  resources :watchlists
  resources :interests
  resources :breeds
  resources :breed_preferences
  resources :pets
  devise_for :users
  root to: "home#index"

end
