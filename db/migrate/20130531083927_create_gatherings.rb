class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.string :type, null: false
      t.datetime :start_at, null: false

      t.timestamps
    end
  end
end
