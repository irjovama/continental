class Question < ApplicationRecord
  belongs_to :test
  belongs_to :category

  has_many :user_question, dependent: :destroy
  has_many :users, through: :user_question, dependent: :destroy
end
