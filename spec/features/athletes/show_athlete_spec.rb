require "rails_helper"

RSpec.describe "show_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "athlete show page: Athlete is displayed with params" do
      athlete = Athlete.create!(name: "John", gender: "Male", height: 72, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)

      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_content(athlete.name)
      expect(page).to have_content(athlete.gender)
      expect(page).to have_content(athlete.height)
      expect(page).to have_content(athlete.weight)
      expect(page).to have_content(athlete.birthday)

      expect(page).to have_link("Edit Athlete")
    end
  end

  describe "SAD PATHS" do
    it "athlete show page: Athlete does not exist" do

      visit athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
  end
end
