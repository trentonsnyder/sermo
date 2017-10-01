Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  post 'user_token', to: 'user_token#create'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      get 'user', to: 'users#user'
      post 'hooks/messenger', to: 'hooks#messenger'
      resources :clients, only: [:create, :index, :update, :destroy] do
        get '/documents', to: 'documents#index'
        post '/documents', to: 'documents#create'
        get '/documents/:id/assign_url', to: 'documents#assign_url'
        delete '/documents', to: 'documents#destroy'
      end
      resources :tasks, only: [:create, :index, :update, :destroy]
      resources :messages, only: [:index, :create]
    end
  end
end
