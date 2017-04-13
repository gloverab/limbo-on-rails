Rails.application.routes.draw do
  root 'application#splash'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :decisions
  post '/decisions/new', to: 'decisions#create'
  post '/decisions/new_from_index', to: 'decisions#new'

end
