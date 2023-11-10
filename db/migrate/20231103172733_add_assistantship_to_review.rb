# frozen_string_literal: true

class AddAssistantshipToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :assistantship, :boolean
  end
end
