class Api::V1::AuthController < BaseController
  before_action :authenticate_user
end