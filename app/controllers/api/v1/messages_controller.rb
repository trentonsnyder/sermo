class Api::V1::MessagesController < Api::V1::AuthController
  
  def index
    @messages = Message.all
    # render jbuilder
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      # render jbuilder
    else
      render json: { error: 'Message not saved.' }, status: 422
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :room_id)
  end

end