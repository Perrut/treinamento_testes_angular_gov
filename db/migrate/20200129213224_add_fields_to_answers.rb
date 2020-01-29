class AddFieldsToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :question, null: true, foreign_key: true
  end
end
