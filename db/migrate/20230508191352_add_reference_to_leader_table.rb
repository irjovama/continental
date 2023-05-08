class AddReferenceToLeaderTable < ActiveRecord::Migration[7.0]
  def change
    add_column :user_leaders, :leader_id, :integer, null: false
  end
end