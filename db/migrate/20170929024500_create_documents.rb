class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :url
      t.string :extension
      t.belongs_to :task, index: true
      t.belongs_to :client, index: true
    end
  end
end
