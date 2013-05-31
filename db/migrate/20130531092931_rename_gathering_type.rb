class RenameGatheringType < ActiveRecord::Migration
  def change
    rename_column :gatherings, :type, :kind
  end
end
