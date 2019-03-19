class CreateGamesTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :games_teams do |t|
      t.integer :game_id
      t.integer :team_id
      t.boolean :home_team, default: false

      t.timestamps
    end
  end
end
