Rails.application.routes.draw do
  use_doorkeeper
  #devise_for :users
  devise_for :users, controllers: { session: "v1/user_management/session" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  draw :user_management
  draw :meta
  draw :course_management
  # Defines the root path route ("/")
  # root "articles#index"


end
