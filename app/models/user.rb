class User < ActiveRecord::Base
  has_many :articles     # has 1:M association
  before_save { self.email = email.downcase }  #email in lowercase saved to DB
  validates :username, presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }
  #add secure password
  has_secure_password
end
