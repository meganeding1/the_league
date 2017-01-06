class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users
  belongs_to :team_captain, class_name: "User", foreign_key: "user_id"
  accepts_nested_attributes_for :team_captain
  has_many :game_teams
  has_many :games, through: :game_teams
  belongs_to :sport
  validates :name, uniqueness: true
end
