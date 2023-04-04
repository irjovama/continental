class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :middlename
      t.string :lastname
      t.string :email
      t.references :leader

      t.timestamps
    end
  end
end
