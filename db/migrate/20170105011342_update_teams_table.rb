class UpdateTeamsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :team_captain, :string
    add_reference :teams, :user, index: true
  end
end
