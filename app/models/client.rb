class Client < ApplicationRecord
  belongs_to :company

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

end