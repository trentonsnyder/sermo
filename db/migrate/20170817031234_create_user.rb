class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :password_digest
      t.string :password
      t.string :password_confirmation
      t.belongs_to :company, index: true
    end
  end
end
