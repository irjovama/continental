class CreateLeaderships < ActiveRecord::Migration[7.0]
  def change
    create_table :leaderships do |t|

      t.timestamps
    end
  end
end
