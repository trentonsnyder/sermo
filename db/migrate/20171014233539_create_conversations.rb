class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.boolean :open, default: false
      t.boolean :notification, default: false
      t.belongs_to :client, index: true
    end

    create_table :user_conversations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :conversation, index: true
    end
  end
end
