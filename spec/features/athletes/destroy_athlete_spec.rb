require "rails_helper"

RSpec.describe "destroy_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "destroy athlete: Athlete is deleted" do
      athlete = Athlete.create!(name: "John", gender: "Male", height: 72, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)

      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_link("Delete Athlete")
      
      click_link("Delete Athlete")

      expect(page).to have_text("Athlete successfully deleted.")
    end
  end

  describe "SAD PATHS" do
    it "athlete destroy page: Athlete does not exist" do

      visit athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
  end
end