# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# me = [
#   {:candidate_id => "1", :candidate_info => "Francesco Romano"}
# ]


# Create new users
users = [
  { user_netid: '123', user_email: 'admin.phd@tamu.edu', user_name: 'admin', user_level: 'admin', password: 'admin' }
  # adxd more users as needed
]

# Array of sample reviews data
# reviews_data = [
#   { review_id: 1, user_netid: 'shreyasskasetty', applicant_id: '8914560391', review_info: 'Excellent research proposal.', created_at: Time.now, updated_at: Time.now, rating: 5, status: 'Completed', gar: true, gat: false },
#   { review_id: 2, user_netid: 'shreyasskasetty', applicant_id: '6614544379', review_info: 'Good academic record, but lacking in publications.', created_at: Time.now, updated_at: Time.now, rating: 3, status: 'InProgress', gar: false, gat: true },
#   { review_id: 3, user_netid: 'shreyasskasetty', applicant_id: '9570272315', review_info: 'Strong letters of recommendation.', created_at: Time.now, updated_at: Time.now, rating: 4, status: 'Assigned', gar: true, gat: true },
#   # ... add as many reviews as needed
# ]

# # Create or update reviews in the database
# reviews_data.each do |data|
#   Review.find_or_create_by(review_id: data[:review_id]) do |review|
#     review.user_netid = data[:user_netid]
#     review.applicant_id = data[:applicant_id]
#     review.review_info = data[:review_info]
#     review.created_at = data[:created_at]
#     review.updated_at = data[:updated_at]
#     review.rating = data[:rating]
#     review.status = data[:status]
#     review.gar = data[:gar]
#     review.gat = data[:gat]
#   end
# end


# Save users to the database
users.each do |user|
  User.create!(user)
end

# Clear existing tasks data
Task.destroy_all
