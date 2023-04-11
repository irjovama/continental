class Category < ApplicationRecord
  # validations
  validates :name, :weight, presence: true
  validates :weight, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  has_many :sub_categories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category", optional: true
  has_many :results
  # belongs_to :category
end
