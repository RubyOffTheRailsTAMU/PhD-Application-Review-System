class AddStatusToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :status, :integer
  end
end
