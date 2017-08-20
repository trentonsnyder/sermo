class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    
    create_table :teams do |t|
      t.string :name
      t.belongs_to :agency, index: true
    end

    create_table :user_teams do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
    end

    create_table :client_teams do |t|
      t.belongs_to :client, index: true
      t.belongs_to :team, index: true
    end

  end
end
