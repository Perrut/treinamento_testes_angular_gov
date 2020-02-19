class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :level
  has_many :answers
end
