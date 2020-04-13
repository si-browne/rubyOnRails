class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates :userid, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
