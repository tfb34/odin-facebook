Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#homepage'
  get '/homepage', to: 'static_pages#homepage'
  get '/about', to: 'static_pages#about'
  resources :users

  resources :friend_requests, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
