Rails.application.routes.draw do

  root to: 'static#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  resources :users
  resources :games
  resources :teams do
    resources :games, only: [:show, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
