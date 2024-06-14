require "rails_helper"

RSpec.describe "show_movement", type: :feature  do
  describe "HAPPY PATHS" do
    it "movement show page: movement is displayed with params" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      movement = athlete.movements.create!(name: "Olympic Squat", description: "Get low", image: "test", video: "test")

      visit movement_path(movement)

      expect(current_path).to eq(movement_path(movement))

      expect(page).to have_content(movement.name)
      expect(page).to have_content(movement.description)
      expect(page).to have_content(movement.image)
      expect(page).to have_content(movement.video)
      # need to add create functionality to display in the show
      expect(page).to have_content(@instructions)
    end
  end
end