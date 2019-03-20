class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :games
  validates :name, presence: true, length: { maximum: 70}
  VAILD_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: { maximum: 255}, format: {with: VAILD_EMAIL_FORMAT}, uniqueness: { case_sensitive: false }

end
