class Question < ApplicationRecord
  belongs_to :test
  belongs_to :category

  has_many :user_question
  has_many :users, through: :user_question
end
