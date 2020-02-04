class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :_question, :_level
  has_many :answers
end
