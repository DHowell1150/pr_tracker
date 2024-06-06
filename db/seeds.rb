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
@dana = @user.athletes.create!(name: "Dana Howell", gender: "Female", feet: 5, inches: 7, weight: 155, birthday: "1982-08-22") ##in pry: Sun, 22 Aug 1982
@stace = @user.athletes.create!(name: "Stacey Kessler", gender: "Female", feet: 5, inches: 10, weight: 175, birthday: "1987-09-06")