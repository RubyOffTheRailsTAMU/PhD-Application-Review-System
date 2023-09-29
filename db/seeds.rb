# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#me = [
#   {:candidate_id => "1", :candidate_info => "Francesco Romano"}
#]

tanay = User.create!(netid: "5290000", user_name: "Tanay", user_level: 1)

Review.create!(user_netid: tanay.netid, candidate_id: "Tanay_CandidateID", review_info: "Tanay is a very good candidate. 10/10. Please admit immidiateley.", review_id: 10)

#sample_review = [{:user_netid => "10", :candidate_id => "1", :review_info => "Tanay is a very good candidate. 10/10. Please admit immidiateley.", :review_id => "101"}]

#sample_review.each do |i|
    #Review.create!(i)
#end

