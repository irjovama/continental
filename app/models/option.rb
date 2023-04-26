class Option < ApplicationRecord
  validates :lower_option, :upper_option, :middle_option, presence: true
  validates :lower_option, :upper_option, :middle_option, length: { in: 4..400 }

  has_many :questions, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["id", "lower_option", "middle_option", "upper_option"]
  end
end
