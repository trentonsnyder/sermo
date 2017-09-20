class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :clients, dependent: :destroy

  validates :name,
    uniqueness: true,
    presence: true
end