class AddUrlToGathering < ActiveRecord::Migration
  def change
    add_column :gatherings, :url, :string
  end
end
