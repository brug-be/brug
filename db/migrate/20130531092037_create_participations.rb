class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :member_id, null: false
      t.integer :gathering_id, null: false

      t.timestamps
    end
  end
end
