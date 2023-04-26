class Description < ApplicationRecord
  validates :title, :body, :result_id, presence: true
  belongs_to :result
  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "body"]
  end

end
