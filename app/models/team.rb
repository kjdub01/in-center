class Team < ApplicationRecord
  has_many :teamgames
  has_many :games, through: :gamesteams

  validates :team_name, presence: true
  validates :contact_name, presence: true
  VALID_PHONE_FORMAT = /^[2-9]\d{2}-\d{3}-\d{4}$/
  validates :contact_phone, presence: true, format: {with: VAILD_PHONE_FORMAT}
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true length: {minimum: 5, maximum: 5}
end
