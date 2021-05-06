Rails.application.routes.draw do
  root 'opinions#index'
  resources :opinions, only: [:new, :create, :index] do
    resources :votes, only: [:create]
  end
  get '/signup', to: 'users#new'
  resources :users
  resources :followings, only: [:new, :create]


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end