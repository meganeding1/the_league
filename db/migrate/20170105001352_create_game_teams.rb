class CreateGameTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :game_teams do |t|
      t.references :game
      t.references :team

      t.timestamps
    end
  end
end
