class User < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams

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
    inclusion: { in: %w(admin) }

  def admin?
    role == 'admin'
  end

end