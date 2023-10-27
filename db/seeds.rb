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


