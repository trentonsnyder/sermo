class Api::V1::UsersController < Api::V1::AuthController
  def user
    render json: current_user, status: 200
  end
end