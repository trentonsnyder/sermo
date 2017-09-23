class AddsMessaging < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :seen, default: false
      t.belongs_to :room, index: true
      t.references :user, index: true
    end

    create_table :rooms do |t|
      t.belongs_to :client, index: true
    end
  end
end
