Rails.application.routes.draw do
  root 'application#splash'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
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

  post '/decisions/new', to: 'decisions#create'
  post '/decisions/new_from_index', to: 'decisions#new'

end
