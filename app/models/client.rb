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
    "#{last_name}, #{first_name}"
  end
end