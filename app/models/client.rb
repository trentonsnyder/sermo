class Client < ApplicationRecord
  has_many :client_teams, dependent: :destroy
  has_many :teams, through: :client_teams

  has_many :tasks, dependent: :destroy

  validates :phone_number,
    uniqueness: true

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  def display_name
    "#{self.last_name}, #{self.first_name}"
  end

  def update_last_seen
    self.update(last_seen: Time.now)
  end

  def assign_teams(teams)
    self.client_teams.destroy_all
    teams.each { |id| client_teams.create(client_id: self.id, team_id: id) }
  end
end