class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :date, null: false
      t.string :location, null: false
      t.string :team_1, null: false
      t.string :team_2, null: false

      t.timestamps
    end
  end
end
