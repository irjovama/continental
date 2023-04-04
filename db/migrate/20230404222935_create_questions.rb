class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :test, null: false, foreign_key: true
      t.string :title
      t.integer :category_id
      t.integer :index
      t.integer :weight

      t.timestamps
    end
  end
end
