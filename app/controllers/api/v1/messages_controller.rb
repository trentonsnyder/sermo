class Api::V1::MessagesController < Api::V1::AuthController

  def index
    @client = current_user.company.clients.find(params[:client_id])
    @messages = @client.messages.order('id ASC').limit(50)
    # render jbuilder
  end

  def create
    @client = current_user.company.clients.find(params[:message][:client_id])
    @message = @client.messages.new(message_params.merge(user_id: current_user.id))
    if @message.save
      # render jbuilder
    else
      render json: { errors: 'Message not saved.' }, status: 422
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :user_id, :seen, :client_id)
  end

end