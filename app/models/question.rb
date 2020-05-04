class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :game_questions, dependent: :destroy
  belongs_to :correct_answer, foreign_key: "correct_answer_id", class_name: "Answer", optional: true
  
  enum level: [ :FACIL, :MEDIO, :DIFICIL, :MUITO_DIFICIL ]

  validate :validate_question_count

  def validate_question_count
    errors.add(:answers, "can't be more than 4 answers per question") if answers.size > 4
  end
end
