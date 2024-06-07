require "rails_helper"

RSpec.describe "edit_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "edit athlete page: Athlete params are edited" do
      athlete = Athlete.create!(name: "John", gender: "Male", height: 72, weight: 200, birthday: "01/01/1991")
      
      visit athlete_path(athlete)
      
      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_link("Edit Athlete")

      click_link("Edit Athlete")

      expect(page).to have_field("Name")
      expect(page).to have_field("Gender")
      expect(page).to have_field("Height")
      expect(page).to have_field("Weight")
      expect(page).to have_field("Birthday")
      expect(page).to have_button("Submit")

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Submit")

      expect(page).to have_text("Athlete successfully updated.")
    end
  end

  describe "SAD PATHS" do
    it "athlete edit page: Athlete does not exist" do

      visit edit_athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
    
    it "edit athlete page: missing params - name" do
      visit edit_athlete_path(athlete)

      fill_in("Name", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Name cannot be blank")
    end

    it "edit athlete page: missing params - gender" do
      visit edit_athlete_path(athlete)

      fill_in("Gender", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Gender cannot be blank")
    end

    it "edit athlete page: missing params - height" do
      visit edit_athlete_path(athlete)

      fill_in("Height", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Height cannot be blank")
    end

    it "edit athlete page: missing params - weight" do
      visit edit_athlete_path(athlete)

      fill_in("Weight", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Weight cannot be blank")
    end

    it "edit athlete page: invalid params - height not a number" do
      visit edit_athlete_path(athlete)

      fill_in("Height", with: "seventy-two")
      click_button("Update Athlete")

      expect(page).to have_text("Height is not a number")
    end

    it "edit athlete page: invalid params - weight not a number" do
      visit edit_athlete_path(athlete)

      fill_in("Weight", with: "one eighty")
      click_button("Update Athlete")

      expect(page).to have_text("Weight is not a number")
    end
  end
end