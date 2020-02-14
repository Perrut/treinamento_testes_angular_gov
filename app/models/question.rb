class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :game_questions, dependent: :destroy
  belongs_to :correct_answer, foreign_key: "correct_answer_id", class_name: "Answer", optional: true
  
  enum _level: [ :FACIL, :MEDIO, :DIFICIL, :MUITO_DIFICIL ]
  
end
