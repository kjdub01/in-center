class GameSerializer < ActiveModel::Serializer
  attributes :id, :starts_at
  has_many :teams, serializer: GamesTeamSerializer
  #belongs_to :games_team
  belongs_to :user
end
