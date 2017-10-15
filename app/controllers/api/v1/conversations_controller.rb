class Api::V1::ConversationsController < Api::V1::AuthController

  def index
    @conversations = Conversation.joins(client: :company).where('companies.id = ? AND conversations.open = true', current_user.company.id)
    # render jbuilder
  end

  def my_conversations
    @conversations = current_user.conversations
    # render jbuilder
  end

  def close
    @client = current_user.company.clients.find(params[:id])
    @conversation = @client.conversation
    if @conversation.update(open: false, notification: false)
      @conversation.user_conversations.destroy_all
      # render jbuilder
    else
      render json: { error: 'Conversation not updated' }, status: 422
    end
  end

end