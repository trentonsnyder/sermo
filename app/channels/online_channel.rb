class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_#{current_user.id}"
  end
end
