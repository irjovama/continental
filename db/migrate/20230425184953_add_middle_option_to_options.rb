class AddMiddleOptionToOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :options, :middle_option, :string
  end
end
