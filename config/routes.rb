Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  post 'user_token', to: 'user_token#create'

  namespace :api do
    namespace :v1 do
      get 'user', to: 'users#user'
      resources :clients
      resources :teams
    end
  end
end
