class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :min_range
      t.integer :max_range

      t.timestamps
    end
  end
end
