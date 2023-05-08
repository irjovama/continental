class RemoveLeaderIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :leader, index:true
  end
end
