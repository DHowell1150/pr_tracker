require "rails_helper"

RSpec.describe "index_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "athlete index page: Athlete is displayed with params" do
      athlete_1 = Athlete.create!(name: "John", gender: "Male", height: 72, weight: 200, birthday: "01/01/1991")
      athlete_2 = Athlete.create!(name: "Jane", gender: "Female", height: 60, weight: 125, birthday: "02/02/1992")
      
      visit athletes_path
      
      expect(current_path).to eq(athletes_path)
      
      expect(page).to have_content(athlete_1.name)
      expect(page).to have_content(athlete_1.gender)
      expect(page).to have_content(athlete_1.height)
      expect(page).to have_content(athlete_1.weight)
      expect(page).to have_content(athlete_1.birthday)
      
      expect(page).to have_content(athlete_2.name)
      expect(page).to have_content(athlete_2.gender)
      expect(page).to have_content(athlete_2.height)
      expect(page).to have_content(athlete_2.weight)
      expect(page).to have_content(athlete_2.birthday)
    end

    it "athlete index page: Displays no athletes message when none exist" do

      visit athletes_path
      
      expect(current_path).to eq(athletes_path)

      expect(page).to have_text("No athletes found.")
      expect(page).to have_link("Create Athlete")

      click_link("Create Athlete")

      expect(current_path).to eq(new_athlete_path)
    end
  end

  # I can't think of any SAD PATHS for this feature.
end