Rails.application.routes.draw do
  resources :user_recipes
  resources :registrations, only: [:create] 
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
  resources :ingredients
  resources :shopping_items
  get 'user_recipes/index'
  get 'user/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
