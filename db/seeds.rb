# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
me = [
    {:candidate_id => "1", :candidate_info => "Francesco Romano"}
]

sample_user = [
    {:appuser_netid => "10", :appuser_name => "Juan Direction", :appuser_level => "1"}
]

appuser1 = AppUser.create!(appuser_netid: "12345", appuser_name: 'Dr. Doofenshmirtz', appuser_level: "1")
Review.create!(appuser_netid: "10", candidate_id: "candidate1.candidate_id", review_info: "Tanay is a very good candidate. 10/10. Please admit immidiateley.", review_id: 2)

#sample_review = [{:appuser_netid => "10", :candidate_id => "1", :review_info => "Tanay is a very good candidate. 10/10. Please admit immidiateley.", :review_id => "101"}]

#sample_review.each do |i|
    #Review.create!(i)
#end

