require "rails_helper"

RSpec.describe "edit_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    before do
      @user = User.create!(
        username: "funbucket13",
        password: "test", 
        email: "funbucket@aol.com")
  
      visit login_path
  
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      fill_in :email, with: @user.email
  
      click_on "Log In"
      expect(current_path).to eq(root_path)
    end

    it "edit athlete page: Athlete params are edited" do
      athlete = @user.athletes.create!(name: "John", gender: "Male", height: 72, weight: 200, birthday: "01/01/1991")
      
      visit athlete_path(athlete)
      
      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_link("Edit Athlete")

      click_link("Edit Athlete")

      expect(page).to have_field("Name", with: athlete.name)
      expect(page).to have_select("Gender", selected: athlete.gender)
      expect(page).to have_field("Feet", with: athlete.feet)
      expect(page).to have_field("Inches", with: athlete.inches)
      expect(page).to have_field("Weight", with: athlete.weight)
      expect(page).to have_field("Birthday", with: athlete.birthday)

      fill_in("Weight", with: 195)

      click_button("Update #{athlete.name}")

      expect(page).to have_text("Athlete successfully updated.")
      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_text("Weight: 195")
    end
  end

  describe "SAD PATHS" do
    xit "athlete edit page: Athlete does not exist" do

      visit edit_athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
    
    xit "edit athlete page: missing params - name" do
      visit edit_athlete_path(athlete)

      fill_in("Name", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Name cannot be blank")
    end

    xit "edit athlete page: missing params - gender" do
      visit edit_athlete_path(athlete)

      fill_in("Gender", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Gender cannot be blank")
    end

    xit "edit athlete page: missing params - height" do
      visit edit_athlete_path(athlete)

      fill_in("Height", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Height cannot be blank")
    end

    xit "edit athlete page: missing params - weight" do
      visit edit_athlete_path(athlete)

      fill_in("Weight", with: "")
      click_button("Update Athlete")

      expect(page).to have_text("Weight cannot be blank")
    end

    xit "edit athlete page: invalid params - height not a number" do
      visit edit_athlete_path(athlete)

      fill_in("Height", with: "seventy-two")
      click_button("Update Athlete")

      expect(page).to have_text("Height is not a number")
    end

    xit "edit athlete page: invalid params - weight not a number" do
      visit edit_athlete_path(athlete)

      fill_in("Weight", with: "one eighty")
      click_button("Update Athlete")

      expect(page).to have_text("Weight is not a number")
    end
  end
end