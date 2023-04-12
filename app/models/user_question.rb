class UserQuestion < ApplicationRecord
  validates :user_id, :question_id, :evaluation, presence: :true

  belongs_to :user
  belongs_to :question
end
