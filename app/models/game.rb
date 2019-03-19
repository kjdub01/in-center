class Game < ApplicationRecord
  belongs_to :user
  has_many :teamgames
  has_many :teams, through: :gamesteams 
end
