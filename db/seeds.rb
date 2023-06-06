# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

puts 'Creating 4 test users.'
user1 = User.create!(name: 'Bruce Wayne', email: 'bruce@wayne.com', password: '123456', address: "101 Wayne Street", neighbourhood: "Gotham")
user2 = User.create!(name: 'John Doe', email: 'user1@test.com', password: '123456', address: "5 Pearson Street", neighbourhood: "Hackney")
user3 = User.create!(name: 'Jane Doe', email: 'user2@test.com', password: '123456', address: "7 Pearson Street", neighbourhood: "Hackney")
user4 = User.create!(name: 'Sarah Connor', email: 'user3@test.com', password: '123456', address: "2 Terminator Street", neighbourhood: "Brooklyn")
