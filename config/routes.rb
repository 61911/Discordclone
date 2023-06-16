Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "rooms#index"
  
  get 'profiles/show'
  resources :messages
  devise_for :users
  resources :rooms
  resources :posts

  get '/user_posts', to: 'posts#user_posts', as: 'user_posts'
  
  get 'home/index'
  resources :users, only: [:show]
end
