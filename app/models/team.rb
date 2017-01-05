class Team < ApplicationRecord
  has_many :users
  belongs_to :sport
  validates :name, uniqueness: true
end
