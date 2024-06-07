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
      expect(page).to have_content(athlete.birthday)

      expect(page).to have_link("Edit Athlete")
    end

    it "has a link to edit athlete" do
      expect(page).to have_link("Edit")
  
      click_link "Edit"
  
      expect(current_path).to eq(edit_athlete_path(@stace))
    end

    it "has a link to Progress" do
      expect(page).to have_link("Progress")
  
      click_on "Progress"
  
      # expect(current_path).to eq(athlete_path(@stace))
    end
  end

  describe "SAD PATHS" do
    it "athlete show page: Athlete does not exist" do

      visit athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
  end
end
