class Game < ApplicationRecord
  belongs_to :user
  has_many :games_team
  accepts_nested_attributes_for :games_team
  has_many :teams, through: :games_team

  validates :user_id, presence: true
  validates :starts_at, presence: true

  def home_team
    which_team = self.games_team.where(home_team: true)
    home_team = Team.find(which_team[0][:team_id])
    home_team
  end

  def away_team
    which_team = self.games_team.where(home_team: false)
    away_team = Team.find(which_team[0][:team_id])
    away_team
  end
end
