Rails.application.routes.draw do
  resources :interests
  devise_for :users
  root to: "home#index"

end
