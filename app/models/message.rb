class Message < ApplicationRecord
  belongs_to :client
  belongs_to :user, required: false

  validates :body,
    presence: true
  
  after_create_commit {MessageBroadcastJob.perform_now self}
end