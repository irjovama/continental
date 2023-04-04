class CreateUserTests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :evaluated_id
      t.integer :status
      t.string :token

      t.timestamps
    end
  end
end
