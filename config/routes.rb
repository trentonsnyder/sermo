Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  post 'user_token', to: 'user_token#create'
end
