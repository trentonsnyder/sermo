class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :action
      t.text :body
      t.datetime :due_date
      t.integer :priority
      t.string :status
      t.belongs_to :client, index: true
    end
  end
end
