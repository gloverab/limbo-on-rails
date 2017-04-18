Rails.application.routes.draw do
  root 'application#splash'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
    get 'most_indecisive', on: :collection
    get 'most_decisive', on: :collection
    resources :decisions, only: [:index]
    resources :avatars do
      post 'select', to: 'users#avatar_select'
    end
  end
  resources :options

  resources :decisions do
    resources :options do
      post 'vote', to: 'votes#create'
    end
  end

  # get '/users/most_indecisive', to: 'users#most_indecisive'
  post '/decisions/new', to: 'decisions#create'
  post '/decisions/new_from_index', to: 'decisions#new'

end
