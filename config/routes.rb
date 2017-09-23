Rails.application.routes.draw do


  #get 'like_relationships/create'

  #get 'like_relationships/destroy'

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#homepage'
  get '/homepage', to: 'static_pages#homepage'
  get '/about', to: 'static_pages#about'
  resources :users

  resources :friend_requests, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships, only: [:create, :destroy, :index]

  resources :posts, only: [:index, :create, :destroy]

  resources :like_relationships, only: [:create, :destroy]

  resources :comments, only: [:new, :create, :destroy, :index]
  get 'comments/cancel'

end
