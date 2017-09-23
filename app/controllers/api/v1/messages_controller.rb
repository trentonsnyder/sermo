class Api::V1::MessagesController < Api::V1::AuthController

  def index
    @room = Room.joins(client: :company).where('companies.id = ?', current_user.company.id).find(params[:room_id])
    @messages = @room.messages.order('id DESC').limit(50)
    # render jbuilder
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :room_id, :user_id, :seen)
  end

end