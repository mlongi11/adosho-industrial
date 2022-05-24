Rails.application.routes.draw do
  root to: "pets#index"

  resources :pictures
  resources :matches
  resources :watchlists
  resources :pets
  resources :pet_breeds
  resources :breed_webs
  resources :list_of_breeds
  resources :breeds
  resources :interests
  devise_for :users
  

end
