class GameSerializer < ActiveModel::Serializer
  attributes :id, :_player_name, :_score
  has_many :_questions
end
