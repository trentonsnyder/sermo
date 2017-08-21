class Api::V1::TeamsController < Api::V1::AuthController
  before_action :admin_only, only: [:create]
  before_action :set_agency, only: [:create]

  def index
    render json: { teams: current_user.teams }, status: 200
  end

  def create
    @team = @agency.teams.new(team_params)
    if @team.save
      render json: { team: @team, message: 'Team Saved.' }, status: 200
    else
      render json: { error: 'Team not saved.' }, status: 422
    end
  end

  private

  def team_params
    parms.require(:team).permit(:name)
  end
end