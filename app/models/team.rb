class Team < ApplicationRecord
  belongs_to :agency

  has_many :client_teams, dependent: :destroy
  has_many :clients, through: :client_teams

  validates :name,
    uniqueness: { scope: :agency, case_sensative: :false }
end