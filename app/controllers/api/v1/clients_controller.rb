class Api::V1::ClientsController < Api::V1::AuthController
  before_action :set_company, only: [:create]

  def index
    @clients = Client.joins(teams: :users).where('users.id = ?', current_user.id)
    # render jbuilder
  end

  def create
    @client = @company.clients.new(client_params)
    if @client.save
      @client.update_last_seen
      if params[:teams] && @client.assign_teams(@company.teams.pluck(:id) & params[:teams])
        render json: { client: @client, message: 'Client saved.' }, status: 200
      else
        render json: { client: @client, message: 'Client saved. No teams assigned.' }, status: 200
      end
    else
      render json: { error: 'Client not saved.' }, status: 422
    end
  end

  private
  
  def client_params
    params.require(:client).permit(:first_name, :last_name, :phone_number)
  end

end