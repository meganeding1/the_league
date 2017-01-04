class User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true
end
