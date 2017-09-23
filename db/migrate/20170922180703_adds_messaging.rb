class AddsMessaging < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :seen, default: false
      t.belongs_to :client, index: true
      t.belongs_to :user, index: true
    end
  end
end
