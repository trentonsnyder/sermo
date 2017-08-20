class ClientTeam < ApplicationRecord
  belongs_to :team
  belongs_to :client

  validates :team_id,
    uniqueness: { scope: :client_id }
end