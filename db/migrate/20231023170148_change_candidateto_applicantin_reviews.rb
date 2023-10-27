class ChangeCandidatetoApplicantinReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :candidate_id, :applicant_id
  end
end
