class CreateTeamUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_users do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
  end
end
