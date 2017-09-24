class Task < ApplicationRecord
  belongs_to :client

  validates :name,
    presence: true

  validates :client_id,
    presence: true

  validates :status,
    presence: true,
    inclusion: { in: %w(open pending completed revision) }

  def self.next_due
    self.where('tasks.status IN (?)', ['open', 'pending']).order("due_date ASC").first
  end
end