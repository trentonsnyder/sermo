Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  post 'user_token', to: 'user_token#create'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      get 'user', to: 'users#user'
      resources :clients, only: [:create, :index, :update, :destroy]
      resources :tasks, only: [:create, :index, :update, :destroy]
      resources :messages, only: [:index]
    end
  end
end
