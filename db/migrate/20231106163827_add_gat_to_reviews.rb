# frozen_string_literal: true

class AddGatToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :gat, :boolean
  end
end
