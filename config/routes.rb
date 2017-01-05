Rails.application.routes.draw do

  root to: 'home#index'

  get '/users/:id/profile' => 'users#profile'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # resources :sports It does both

  resources :sports do
    resources :teams, except: [:show]
  end
  resources :teams, only: [:show]
end
