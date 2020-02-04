class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :game_questions, dependent: :destroy
  
  enum _level: [ :FACIL, :MEDIO, :DIFICIL, :MUITO_DIFICIL ]
  
end
