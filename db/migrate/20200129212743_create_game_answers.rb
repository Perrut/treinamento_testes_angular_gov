class CreateGameAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_questions do |t|
      t.references :game, null: true, foreign_key: true
      t.references :question, null: true, foreign_key: true

      t.timestamps
    end
  end
end
