class CreateAgency < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name
    end
  end
end
