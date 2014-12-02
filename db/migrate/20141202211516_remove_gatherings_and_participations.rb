class RemoveGatheringsAndParticipations < ActiveRecord::Migration
  def up
    drop_table :gatherings
    drop_table :participations
  end
end
