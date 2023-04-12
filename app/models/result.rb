class Result < ApplicationRecord
  validates :category_id, :max_range, :min_range, presence: true
  validates :max_range, :min_range, numericality: {greater_than_or_equal_to: 0}

  belongs_to :category
  has_many :descriptions, dependent: :destroy
end
