class UserQuestionValidator < ActiveModel::Validator
  def validate(record)
    if record.question.question_type != "points" && record.evaluation.to_i > 0
      record.errors.add :base, "This is not a points type of question"
    end

    if record.question.question_type == "points" && record.evaluation.to_i == 0
      record.errors.add :base, "This type of questions only receive numbers greater than 0"
    end

    if record.question.question_type == "points" && record.evaluation.to_i > 10
      record.errors.add :base, "This type of question only receive a maximum point of 10"
    end
  end
end


class UserQuestion < ApplicationRecord
  validates :user_id, :question_id, :evaluation, presence: :true
  validates_with UserQuestionValidator

  belongs_to :user
  belongs_to :question
end




