# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@user = User.create!(username: "Dana Howell", email: "howelld115@gmail.com", password: "test")

@user1 = @user.athletes.create!(name: "Jane Doe", gender: "Female", feet: 5, inches: 7, weight: 155, birthday: "1982-08-22")
@user2 = @user.athletes.create!(name: "Jo Smith", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "1987-09-06")

movement1 = @user1.movements.create!(name: "Squat", description: "Get low", image: "test", video: "test")
movement2 = @user1.movements.create!(name: "Bench Press", description: "Beach muscle galore", image: "test", video: "test")
movement3 = @user1.movements.create!(name: "Deadlift", description: "Bootaaay", image: "test", video: "test")