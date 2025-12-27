# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding users..."

users = User.create!([
  {
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    email: "yark@example.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    email: "abbey@example.com",
    password: "password",
    password_confirmation: "password"
  }
])

puts "Created #{users.count} users"

puts "Seeding events..."

users[0].created_events.create!(
  title: "Rails Meetup",
  location: "Accra",
  date: Date.today + 7
)

users[1].created_events.create!(
  title: "Ruby Hack Night",
  location: "Kumasi",
  date: Date.today + 14
)

users[2].created_events.create!(
  title: "Startup Pitch",
  location: "Cape Coast",
  date: Date.today + 21
)

puts "Events created"
