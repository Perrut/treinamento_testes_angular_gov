class Answer < ApplicationRecord
  belongs_to :question, optional: false

  validate :validate_question_count

  def validate_question_count
    errors.add(:answers, "can't be more than 4 answers per question") if self.question && self.question.answers.size > 4
  end
end
