require "rails_helper"

RSpec.describe "new_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "new athlete page: Creates a new athlete" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      expect(page).to have_field("Name")
      expect(page).to have_field("Gender")
      expect(page).to have_field("Height")
      expect(page).to have_field("Weight")
      expect(page).to have_field("Birthday")
      expect(page).to have_button("Create Athlete")

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Athlete created successfully.")
    end
  end

  describe "SAD PATHS" do
    it "new athlete page: missing params - name" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      fill_in("Name", with: "")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Name cannot be blank.")
    end

    it "new athlete page: missing params - gender" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "")
      fill_in("Height", with: 60)
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Gender cannot be blank.")
    end

    it "new athlete page: missing params - height" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: "")
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Height cannot be blank.")
    end

    it "new athlete page: missing params - weight" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: "")
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Weight cannot be blank.")
    end

    it "new athlete page: missing params - birthday" do
      visit new_athlete_path
      
      expect(current_path).to eq(new_athlete_path)

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "")

      click_button("Create Athlete")

      expect(page).to have_text("Birthday cannot be blank.")
    end

    it "new athlete page: invalid params - height not a number" do
      visit new_athlete_path

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: "sixty")
      fill_in("Weight", with: 125)
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Height is not a number")
    end

    it "new athlete page: invalid params - weight not a number" do
      visit new_athlete_path

      fill_in("Name", with: "Jane")
      fill_in("Gender", with: "Female")
      fill_in("Height", with: 60)
      fill_in("Weight", with: "one twenty-five")
      fill_in("Birthday", with: "02/02/1992")

      click_button("Create Athlete")

      expect(page).to have_text("Weight is not a number")
    end
  end
end