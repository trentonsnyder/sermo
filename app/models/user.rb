class User < ApplicationRecord
  belongs_to :company

  has_many :messages

  has_many :user_conversations, dependent: :destroy
  has_many :conversations, through: :user_conversations

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

  def display_name
    "#{self.first_name}"
  end

  def message_name
    "#{self.first_name} #{self.last_name[0]}"
  end

  def assign_conversation(client)
    self.user_conversations.find_or_create_by(conversation_id: client.conversation.id)
  end

end