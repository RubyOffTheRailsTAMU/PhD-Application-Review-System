class AddFieldstoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :user, :netid, :string
    add_column :user, :user_name, :string
    add_column :user, :user_level, :integer
  end
end
