Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw :user_management
  # Defines the root path route ("/")
  # root "articles#index"


end
