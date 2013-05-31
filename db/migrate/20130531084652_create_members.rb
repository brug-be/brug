class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
