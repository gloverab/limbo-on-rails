Rails.application.routes.draw do
  resources :comments
  resources :discussions
  root 'application#splash'

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users do
    get 'most_indecisive', on: :collection
    get 'most_decisive', on: :collection
    post 'image_select', to: 'users#image_select'
    resources :decisions, only: [:index]
    resources :discussions, only: [:index]
  end
  resources :options
  resources :replies
  resources :decisions do
    post 'vote', to: 'votes#create'
  end

  patch '/decisions/:id/edit', to: 'decisions#update'
  post '/decisions/new', to: 'decisions#create'

end
