require 'jwt'

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    private

    def find_verified_user
      decoded_token = JWT.decode request.params[:token], Rails.application.secrets.secret_key_base, true, { :algorithm => 'HS256' }
      if current_user = User.find(decoded_token[0]['sub'])
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
