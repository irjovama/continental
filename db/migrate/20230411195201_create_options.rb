class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :upper_option
      t.string :lower_option

      t.timestamps
    end
  end
end
