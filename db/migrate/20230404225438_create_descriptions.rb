class CreateDescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :descriptions do |t|
      t.references :result, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
