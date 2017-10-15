class MessageBroadcastJob < ApplicationJob  
  queue_as :default

  def perform(conversation, message)
    ActionCable.server.broadcast('messages', {conversation: conversation, message: message})
  end

end