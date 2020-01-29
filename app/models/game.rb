class Game < ApplicationRecord
  has_many :game_questions, dependent: :destroy
  has_many :questions, through: :game_questions
end
