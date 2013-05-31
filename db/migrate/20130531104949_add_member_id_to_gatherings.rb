class AddMemberIdToGatherings < ActiveRecord::Migration
  def change
    add_column :gatherings, :owner_id, :integer, null: false
  end
end
