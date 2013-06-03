Brug::Application.routes.draw do
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :gatherings do
    post 'join' => 'participations#join'
    delete 'leave' => 'participations#leave'
  end

  root 'pages#landing'
end
