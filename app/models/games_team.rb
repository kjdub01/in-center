class GamesTeam < ApplicationRecord
  belongs_to :team
  belongs_to :game

  validates :team_id, presence: true
  validates :game_id, presence: true
end
