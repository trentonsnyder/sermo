class User < ApplicationRecord
  belongs_to :company

  has_many :messages, as: :messageable

  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 6 },
    allow_nil: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  validates :role,
    presence: true,
    inclusion: { in: %w(admin member) }

  def admin?
    role == 'admin'
  end

end