class RenameAppuserNetidToNetid < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :appuser_netid, :netid
  end
end
