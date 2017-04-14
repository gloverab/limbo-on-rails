Rails.application.routes.draw do
  root 'application#splash'

  devise_for :users
  resources :users
  resources :options

  resources :decisions do
    resources :options do
      post 'vote', to: 'votes#create'
    end
  end


  # resources :options
  post '/decisions/new', to: 'decisions#create'
  post '/decisions/new_from_index', to: 'decisions#new'


end
