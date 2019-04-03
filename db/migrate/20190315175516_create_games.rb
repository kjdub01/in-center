class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.time :starts_at
      t.date :date

      t.timestamps
    end
  end
end
