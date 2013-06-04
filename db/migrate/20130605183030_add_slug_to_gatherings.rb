class AddSlugToGatherings < ActiveRecord::Migration
  def change
    add_column :gatherings, :slug, :string
    add_index  :gatherings, :slug, unique: true
    Gathering.all.map(&:save)
  end
end
