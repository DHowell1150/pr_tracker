require "rails_helper"

RSpec.describe "show_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "athlete show page: Athlete is displayed with params" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)

      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_content(athlete.name)
      expect(page).to have_content(athlete.gender)
      expect(page).to have_content(athlete.feet)
      expect(page).to have_content(athlete.inches)
      expect(page).to have_content(athlete.weight)
      expect(page).to have_content(athlete.birthday.strftime("%-m/%-d/%Y"))
    end

    it "has a link to edit athlete" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)
      expect(page).to have_link("Edit Athlete")
  
      click_link "Edit Athlete"
      
      expect(current_path).to eq(edit_athlete_path(athlete))
    end

    it "has a link to Create Movement" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)
      expect(page).to have_link("Create New Movement")
      click_link "Create New Movement"
      expect(current_path).to eq(new_athlete_movement_path(athlete))
    end


    # I don't think I need to test the following here because that will be tested in create_movement, correct? 
    # it "has a movement" do
    #   user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
    #   athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

    #   visit athlete_path(athlete) 
    #   click_link "Create New Movement"
    #   expect(current_path).to eq(new_movement_path)
    #   expect(page).to have_select('Name:', options: ["Pullups", 
    #                                                       "Olympic Squat", 
    #                                                       "Dumbbell Bench Press", 
    #                                                       "Clean and jerk", 
    #                                                       "Barbell Deadlift"
    #                                                     ])
    #   expect(page).to have_field("Description:")
    #   expect(page).to have_field("Image:")
    #   expect(page).to have_field("Video:")
    #   expect(page).to have_button("Add Movement")
    #   select "Olympic Squat", from: "Name:"
    #   fill_in "Description:", with: "A description"
    #   fill_in "Image:", with: "image_url"
    #   fill_in "Video:", with: "video_url"

    #   click_button "Add Movement"
    #   expect(current_path).to eq(athlete_path(athlete))
    #   within '.movement' do
    #     expect(page).to have_content("Olympic Squat")
    #     expect(page).to have_content("A description")
    #     expect(page).to have_content("image_url")
    #     expect(page).to have_content("video_url")
    #   end
    # end

    it "has a link to Progress" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)
      expect(page).to have_link("Progress")
  
      click_on "Progress"
  
      # expect(current_path).to eq(athlete_path(@stace))
    end
  end

  describe "SAD PATHS" do # Can I test this if I don't have an ID to route to?
    xit "athlete show page: Athlete does not exist" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      # visit athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
  end
end
