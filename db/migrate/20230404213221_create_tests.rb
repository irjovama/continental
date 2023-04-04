class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :description
      t.integer :asignation_counter
      t.integer :finish_counter

      t.timestamps
    end
  end
end
