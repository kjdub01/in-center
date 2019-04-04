class Game < ApplicationRecord
  belongs_to :user
  has_many :games_team
  accepts_nested_attributes_for :games_team
  has_many :teams, through: :games_team

end
