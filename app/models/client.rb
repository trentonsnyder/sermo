class Client < ApplicationRecord
  belongs_to :company
  
  has_many :tasks, dependent: :destroy
  has_many :messages, as: :messageable

  has_one :room, dependent: :destroy
  
  phony_normalize :phone_number, default_country_code: 'US'
  validates :phone_number,
    presence: true,
    uniqueness: { scope: :company_id },
    length: { minimum: 10 },
    phony_plausible: true

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true
  
  validates :last_seen,
    presence: true

  after_create :set_up_associations

  def display_name
    "#{self.last_name}, #{self.first_name}"
  end

  def update_last_seen
    self.update(last_seen: Time.now)
  end

  def set_up_associations
    self.create_room()
  end

end