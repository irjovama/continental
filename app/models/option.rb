class Option < ApplicationRecord
  validates :lower_option, :upper_option, presence: true
  validates :lower_option, :upper_option, length: { in: 4..400 }

  has_many :questions, dependent: :destroy
end
