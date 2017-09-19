class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :action
      t.text :body
      t.date :due_date
      t.string :status
      t.belongs_to :client, index: true
    end
  end
end
