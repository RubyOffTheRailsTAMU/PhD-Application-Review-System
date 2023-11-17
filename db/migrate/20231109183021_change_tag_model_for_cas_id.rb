# frozen_string_literal: true

class ChangeTagModelForCasId < ActiveRecord::Migration[6.0]
  # def change
  #   remove_reference :tags, :applicant, index: true, foreign_key: true
  #   add_column :tags, :cas_id, :string
  #   add_index :tags, :cas_id
  # end
end
