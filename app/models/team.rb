class Team < ApplicationRecord
  has_many :teamgames
  has_many :games, through: :teamgame 
end
