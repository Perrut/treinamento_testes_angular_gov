class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_name, :score
  has_many :questions
end
