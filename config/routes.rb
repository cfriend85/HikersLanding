Rails.application.routes.draw do
  get '/' => 'sessions#index'
  post '/new' => 'sessions#new'
  post '/show' => 'sessions#show'
  get '/logout' => 'sessions#destroy'

  get '/dashboard' => 'hikes#index'
  post '/create/hike' => 'hikes#create'
  get '/show/hike/:id' => 'hikes#show'
  get '/find/hikes' => 'hikes#show_hikes'
  
  
  post '/join/:id' => 'joins#create'
  delete '/unjoin/:id' => 'joins#destroy'
end
