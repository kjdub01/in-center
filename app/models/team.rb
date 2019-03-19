class Team < ApplicationRecord
  has_many :teamgames
  has_many :games, through: :gamesteams  
end
