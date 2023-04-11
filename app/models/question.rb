class Question < ApplicationRecord
  validates :category_id, :weight, :test_id, :title, presence: true
  validates :title, length: { in: 4..110 }
  validates :weight, numericality: {greater_than: 0}
  validates :index, uniqueness: true


  belongs_to :test
  belongs_to :category

  has_many :user_question, dependent: :destroy
  has_many :users, through: :user_question, dependent: :destroy
end
