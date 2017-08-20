class Api::V1::ClientsController < Api::V1::AuthController
  def index
    @clients = Client.joins(teams: :users).where('users.id = ?', current_user.id)
    # render jbuilder
  end
end