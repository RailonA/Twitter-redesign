Rails.application.routes.draw do
  root 'opinions#index'
  resources :opinions, only: %i[new create index] do
    resources :likes, only: %i[create destroy]
  end
  get '/signup', to: 'users#new'
  resources :users
  resources :followings, only: %i[new create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
