class RenameAssToGar < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :assistantship, :gar
  end
end
