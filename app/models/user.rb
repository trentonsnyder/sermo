class User < ApplicationRecord
  has_secure_password

  validates :password,
    presence: true,
    length: { minimum: 6 }, 
    allow_nil: true

  validates :email,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ },
    presence: true
end