# frozen_string_literal: true

class AddUserEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_email, :string
    add_column :users, :password_digest, :string
  end
end
