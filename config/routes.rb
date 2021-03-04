Rails.application.routes.draw do
  root to: "tweets#index"
  devise_for :users
  resources :users
  resources :tweets
end
