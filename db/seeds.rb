# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@user1 = User.create!(username: "Jane Doe", email: "test@test.com", password: "test")

@athlete_1 = @user1.athletes.create!(name: "Jane Doe", gender: "Female", feet: 5, inches: 7, weight: 155, birthday: "1982-08-22") 
@athlete_2 = @user1.athletes.create!(name: "Joe Smith", gender: "male", feet: 6, inches: 0, weight: 200, birthday: "1987-09-06")

@movement1 = @athlete_1.movements.create!(name: "Squat", description: "Get low", image: "test", video: "test")
@movement2 = @athlete_1.movements.create!(name: "Bench Press", description: "Beach muscle galore", image: "test", video: "test")
@movement3 = @athlete_1.movements.create!(name: "Deadlift", description: "Bootaaay", image: "test", video: "test")

