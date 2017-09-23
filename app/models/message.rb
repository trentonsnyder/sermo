class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user, required: false
end