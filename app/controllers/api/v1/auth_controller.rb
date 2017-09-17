class Api::V1::AuthController < BaseController
  before_action :authenticate_user

  def admin_only
    current_user.admin?
  end

  def set_company
    @company = current_user.company
  end
end