class Result < ApplicationRecord
  belongs_to :category
  has_many :descriptions
end
