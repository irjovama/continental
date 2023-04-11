class Question < ApplicationRecord
  validates :category_id, :weight, :test_id, :title, :option_id, :question_type, presence: true
  validates :title, length: { in: 4..110 }
  validates :weight, numericality: {greater_than: 0}
  validates :index, uniqueness: true
  validates :question_type, inclusion: { in: %w(0 1), message: "%{value} is not a valid option" }

  belongs_to :option
  belongs_to :test
  belongs_to :category

  has_many :user_question, dependent: :destroy
  has_many :users, through: :user_question, dependent: :destroy
end
