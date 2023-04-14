class Question < ApplicationRecord
  validates :category_id, :weight, :test_id, :title, :option_id, :question_type, :index, presence: true
  validates :title, length: { in: 4..190 }
  validates :weight, numericality: {greater_than: 0}
  enum question_type: [ :points, :text_input ]
  validates :index, uniqueness: { scope: :test_id }

  belongs_to :option
  belongs_to :test
  belongs_to :category

  has_many :user_question, dependent: :destroy
  has_many :users, through: :user_question, dependent: :destroy
end
