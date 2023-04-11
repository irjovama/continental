class AddReferenceToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :option, null: false, foreign_key: true
  end
end
