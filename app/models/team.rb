class Team < ApplicationRecord
  has_many :games_team
  accepts_nested_attributes_for :games_team
  has_many :games, through: :games_team

  validates :team_name, presence: true
  validates :contact_name, presence: true
  VALID_PHONE_FORMAT = /\A[2-9]\d{2}-\d{3}-\d{4}\z/
  validates :contact_phone, presence: true, format: {with: VALID_PHONE_FORMAT}
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  VALID_ZIPCODE_FORMAT = /\A\d{5}(-\d{4})?\z/
  validates :zipcode, presence: true, format: {with: VALID_ZIPCODE_FORMAT}
end
