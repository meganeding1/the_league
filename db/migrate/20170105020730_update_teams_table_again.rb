class UpdateTeamsTableAgain < ActiveRecord::Migration[5.0]
  def change
    rename_column :teams, :team_captain, :user_id
  end
end
