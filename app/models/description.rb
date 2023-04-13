class Description < ApplicationRecord
  validates :title, :body, :result_id, presence: true
  belongs_to :result
end
