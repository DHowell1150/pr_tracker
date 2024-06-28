require "rails_helper"

RSpec.describe "show_movement", type: :feature  do
  describe "HAPPY PATHS" do
    it "movement show page: movement is displayed with params" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)

      click_link "Create New Movement"
      expect(current_path).to eq(new_movement_path)
      expect(page).to have_select('Name:', options: ["Pullups", 
                                                          "Olympic Squat", 
                                                          "Dumbbell Bench Press", 
                                                          "Clean and jerk", 
                                                          "Barbell Deadlift"
                                                        ])
      expect(page).to have_field("Description:")
      expect(page).to have_field("Image:")
      expect(page).to have_field("Video:")
      expect(page).to have_button("Add Movement")

      select "Olympic Squat", from: "Name:"
      fill_in "Description:", with: "A description"
      fill_in "Image:", with: "image_url"
      fill_in "Video:", with: "video_url"
      click_button "Add Movement"
      expect(current_path).to eq(athlete_path(athlete))

      # visit athlete_movement_path(athlete, movement)
      # visit athlete_path(athlete)

      # expect(current_path).to eq(athlete_movement_path(athlete, movement))
      # expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_content(movement.name)
      expect(page).to have_content(movement.description)
      expect(page).to have_content(movement.image)
      expect(page).to have_content(movement.video)
      # need to add create functionality to display in the show
      expect(page).to have_content(@instructions)
    end
  end
end