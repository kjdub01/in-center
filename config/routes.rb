Rails.application.routes.draw do

  root to: 'static#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
 
  resources :users do
    resources :games, only: [:index, :show, :new]
  end
  resources :games do
    get 'unassigned', on: :collection
  end
  resources :teams do
    resources :games, only: [:show, :index, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
