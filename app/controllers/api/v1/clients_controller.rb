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

  def update
    @client = current_user.company.clients.find(params[:id])
    if @client.update(client_params)
      # render jbuilder
    else
      render json: { error: 'Client not updated' }, status: 422
    end
  end

  def destroy
    @client = current_user.company.clients.find(params[:id])
    client_id = @client.id
    if @client.destroy
      render json: { client: client_id }, status: 200
    else
      render json: { error: 'Client deleted' }, status: 422
    end
  end

  private
  
  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number)
  end

end