class Category < ApplicationRecord
  # validations
  validates :name, :weight, presence: true
  validates :name, length: { in: 4..200 }
  validates :weight, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  validates_associated :questions

  has_many :sub_categories, class_name: "Category", foreign_key: "parent_id", inverse_of: "parent", dependent: :destroy
  belongs_to :parent, class_name: "Category", optional: true
  has_many :results, dependent: :destroy
  has_many :questions, dependent: :destroy
  # belongs_to :category
end
