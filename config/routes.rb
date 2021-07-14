Rails.application.routes.draw do
  get '/' => 'sessions#index'
  post '/new' => 'sessions#new'
  post '/show' => 'sessions#show'
  get '/show/:id' => 'sessions#update'
  patch '/edit/:id' => 'sessions#update_user'
  get '/logout' => 'sessions#destroy'

  get '/dashboard' => 'hikes#index'
  post '/create/hike' => 'hikes#create'
  get '/show/hike/:id' => 'hikes#show'
  get '/find/hikes' => 'hikes#show_hikes'
  get '/guide' => 'hikes#display_guide'
  get '/edit/:id' => 'hikes#update'
  patch '/edit/hike/:id' => 'hikes#update_hike'
  delete '/delete/:id' => 'hikes#destroy'

  post '/add/comment/:id' => 'comments#create'
  
  post '/join/:id' => 'joins#create'
  delete '/unjoin/:id' => 'joins#destroy'
end
