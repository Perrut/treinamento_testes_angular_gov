class Game < ApplicationRecord
  has_many :game_questions, dependent: :destroy
  has_many :_questions, through: :game_questions, source: :question
end
