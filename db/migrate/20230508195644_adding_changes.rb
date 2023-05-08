class AddingChanges < ActiveRecord::Migration[7.0]
  def change
    change_table :leaderships do |t|
      t.references :employee
      t.references :leader
    end
    add_column :leaderships, :leadership_type, :integer, null: false
    # Rails 5+ only: add foreign keys
    add_foreign_key :leaderships, :users, column: :employee_id, primary_key: :id
    add_foreign_key :leaderships, :users, column: :leader_id, primary_key: :id
  end
end
