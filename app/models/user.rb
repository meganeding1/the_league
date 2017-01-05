class User < ApplicationRecord
  has_secure_password
  has_many :teams

  validates :username, :email, uniqueness: true
end
