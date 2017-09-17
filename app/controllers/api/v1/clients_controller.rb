class Api::V1::ClientsController < Api::V1::AuthController
  before_action :set_company, only: [:create]

  def index
    @clients = current_user.company.clients
    # render jbuilder
  end

  def create
    @client = @company.clients.new(client_params.merge(last_seen: Time.now))
    if @client.save
      # render jbuilder
    else
      render json: { message: 'Client not saved.' }, status: 422
    end
  end

  private
  
  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number)
  end

end