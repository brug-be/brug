class AddAvatarUrlToMembers < ActiveRecord::Migration
  def change
    add_column :members, :avatar_url, :string
  end
end
