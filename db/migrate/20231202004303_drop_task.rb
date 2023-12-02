class DropTask < ActiveRecord::Migration[7.0]
  def up
    drop_table :tasks
  end
end
