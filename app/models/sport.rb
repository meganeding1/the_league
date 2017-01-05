class Sport < ApplicationRecord
  has_many :teams
  has_many :game_teams, through: :teams, source: :game_teams
  has_many :games, through: :game_teams, source: :games
end
