class RenameNetidToUserNetid < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :netid, :user_netid
  end
end
