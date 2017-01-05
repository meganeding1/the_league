class User < ApplicationRecord
  has_secure_password
  has_many :team_users
  has_many :teams, through: :team_users
  has_many :games, through: :teams

  validates :username, :email, uniqueness: true
end
