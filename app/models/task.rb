class Task < ApplicationRecord
  belongs_to :client

  validates :name,
    presence: true

  validates :status,
    presence: true,
    inclusion: { in: %w(open pending completed revision) }

  validates :priority,
    presence: true,
    uniqueness: { scope: :client_id }
end