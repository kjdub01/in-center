class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :address1, :address2, :city, :state, :zipcode
  has_many :game
end
