class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :candidate_id
      t.text :candidate_info

      t.timestamps
    end
    add_index :candidates, :candidate_id, unique: true
  end
end
