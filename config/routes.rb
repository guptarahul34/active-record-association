Rails.application.routes.draw do
  resources :events
  devise_for :users
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "home#index"
  root "events#index"
  get "/homepage", to: "home#index"
  get "/user/profile", to: "home#user_profile"
  #============= routes for category===================
  resources :categories
  #=============== routes for comments ================
  resources :events do
    resources :comments
  end
  #============== routes for address ==================
  resources :addresses, only: [:new, :create]
end
