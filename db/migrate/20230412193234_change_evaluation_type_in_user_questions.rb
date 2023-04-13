class ChangeEvaluationTypeInUserQuestions < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :user_questions do |t|
        dir.up   { t.change :evaluation, :text }
        dir.down { t.change :evaluation, :integer }
      end
    end
  end
end