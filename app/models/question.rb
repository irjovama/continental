class Question < ApplicationRecord
  validates :category_id, :weight, :test_id, :title, :question_type, :index, presence: true
  validates :title, length: { in: 4..190 }
  validates :weight, numericality: {greater_than: 0}
  enum question_type: [ :points, :text_input ]
  validates :index, uniqueness: { scope: :test_id }
  validates :option_id, presence: true,  if: Proc.new{ |question| question.question_type == "points"  }

  belongs_to :option, optional: true
  belongs_to :test
  belongs_to :category

  has_many :user_question, dependent: :destroy
  has_many :users, through: :user_question, dependent: :destroy

end
