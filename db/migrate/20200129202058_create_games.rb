class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :_player_name
      t.integer :_score, default: 0

      t.timestamps
    end
  end
end
