class Game < ApplicationRecord
  belongs_to :user, optional: true
  has_many :games_team, :dependent => :destroy
  accepts_nested_attributes_for :games_team
  has_many :teams, through: :games_team

  validates :starts_at, presence: true

  scope :unassigned, -> {where(user_id: nil)}
  scope :game_list, -> {order(starts_at: :asc)}

  def home_team
    which_team = self.games_team.where(home_team: true)
    home_team = Team.find(which_team[0][:team_id])
  end

  def away_team
    which_team = self.games_team.where(home_team: false)
    away_team = Team.find(which_team[0][:team_id])
  end
end
