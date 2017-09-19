class Task < ApplicationRecord
  belongs_to :client

  validates :name,
    presence: true

  validates :client_id,
    presence: true

  validates :status,
    presence: true,
    inclusion: { in: %w(open pending completed revision) }
end