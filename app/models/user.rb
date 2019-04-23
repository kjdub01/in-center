class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :games

  validates :name, presence: true, length: { maximum: 70}
  VAILD_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, format: {with: VAILD_EMAIL_FORMAT, message: "format: example@address.com"}, uniqueness: { case_sensitive: false }
  VALID_PHONE_FORMAT = /\A[2-9]\d{2}-\d{3}-\d{4}\z/
  validates :phone, allow_blank: true, format: {with: VALID_PHONE_FORMAT, message: "Format XXX-XXX-XXXX"}
  VALID_ZIPCODE_FORMAT = /\A\d{5}(-\d{4})?\z/
  validates :zipcode, allow_blank: true, format: {with: VALID_ZIPCODE_FORMAT, message: "Format XXXXX"}
  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash["info"]["email"]).first_or_create do |u|
      u.password = SecureRandom.hex
      u.name = auth_hash["info"]["name"]
    end
  end
end
