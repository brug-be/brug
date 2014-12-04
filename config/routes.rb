Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resource :profile

  get '/blog'  => 'pages#blog'
  get '/about' => 'pages#about'
  get '/community' => 'pages#community'

  root 'meetups#index'
end
