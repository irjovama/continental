class AddUniquenessToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_index :questions, [:test_id, :index], unique: true
  end
end
