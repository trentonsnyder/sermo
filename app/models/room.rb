class Room < ApplicationRecord
  belongs_to :client
  has_many :messages, dependent: :destroy
end