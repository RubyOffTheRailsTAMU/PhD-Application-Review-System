class AddFieldstoUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :netid
      t.string :user_name
      t.integer :user_level
    end
  end
end
