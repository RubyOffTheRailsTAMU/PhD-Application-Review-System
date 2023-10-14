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

tanay = User.create!(user_netid: "5290000", user_name: "Tanay", user_level: "faculty", password_digest:"admin")

# Create new users
users = [
  { user_netid: "123",user_email:"admin.phd@tamu.edu", user_name: "admin", user_level: "admin", password:"admin"},
  { user_netid: "shreyasskasetty",user_email:"shreyasskasetty@tamu.edu", user_name: "Shreyas Shivakumar", user_level: "comittee_member", password_digest:"admin"},
  # adxd more users as needed
]


# Save users to the database
users.each do |user|
  User.create!(user)
end

# Clear existing tasks data
Task.destroy_all



# Create new applicants
applicants = [
  {
    application_cas_id: "CAS12378668687898",
    application_name: "Alice Johnson",
    application_gender: "Female",
    application_citizenship_country: "USA",
    application_dob: "1990-05-14",
    application_email: "alice@example.com",
    application_degree: "Masters",
    application_submitted: "Yes",
    application_status: "Under Review",
    application_research: "Computer Vision",
    application_faculty: "Faculty1"
  },
  {
    application_cas_id: "CAS32493940304930",
    application_name: "Brian",
    application_gender: "Male",
    application_citizenship_country: "USA",
    application_dob: "1990-05-14",
    application_email: "brian@example.com",
    application_degree: "Masters",
    application_submitted: "Yes",
    application_status: "Under Review",
    application_research: "Computer Vision",
    application_faculty: "Faculty1"
  },
  # add more applicants as needed
]


# Save applicants to the database
applicants.each do |applicant|
  Applicant.create!(applicant)
end

# Create new tasks
tasks = [
  {status: 0, user_id: User.find_by(user_netid:"shreyasskasetty").id, applicant_id: Applicant.find_by(application_cas_id: "CAS12378668687898").id}, # Assigned task
  {status: 2, user_id: User.find_by(user_netid:"shreyasskasetty").id, applicant_id: Applicant.find_by(application_cas_id: "CAS32493940304930").id}, # Assigned task
  # add more tasks as needed
]
# Save tasks to the database
tasks.each do |task|
  Task.create!(task)
end


# Review.create!(user_netid: tanay.user_netid, candidate_id: "Tanay_CandidateID", review_info: "Tanay is a very good candidate. 10/10. Please admit immidiateley.", review_id: 10)

#sample_review = [{:user_netid => "10", :candidate_id => "1", :review_info => "Tanay is a very good candidate. 10/10. Please admit immidiateley.", :review_id => "101"}]

#sample_review.each do |i|
    #Review.create!(i)
#end

