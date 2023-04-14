class ChangeReferenceToAcceptNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :questions, :option_id, true
  end
end
