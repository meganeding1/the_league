class Sport < ApplicationRecord
  has_many :teams
  has_many :game_teams, through: :teams, class_name: "GameTeam"
  has_many :games, through: :game_teams, class_name: "Game"

  validates :name, presence: true, uniqueness: true
end
