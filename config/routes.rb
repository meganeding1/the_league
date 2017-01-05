Rails.application.routes.draw do

  get '/' => 'home#index'

  get '/users/:id/profile' => 'users#profile'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
