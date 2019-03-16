class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :hometeam
      t.integer :awayteam
      t.integer :referee
      t.string :timeko
      t.string :dateko

      t.timestamps
    end
  end
end
