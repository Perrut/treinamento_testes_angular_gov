class Answer < ApplicationRecord
  belongs_to :question, optional: false
end
