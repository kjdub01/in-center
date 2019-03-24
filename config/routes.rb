Rails.application.routes.draw do

  root to: 'static#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new', as: :new_user
  post '/signup', to: 'users#create', as: :user
  resources :users, only: [:edit, :update, :destroy]
  resources :teams
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
