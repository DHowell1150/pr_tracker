require "rails_helper"
require "spec_helper"

RSpec.describe "edit_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    before do
      @user = User.create!(
        username: "funbucket13",
        password: "test", 
        email: "funbucket@aol.com")
      
      visit login_path
      fill_in "Username:", with: @user.username
      fill_in "Password:", with: @user.password
      fill_in "Email Address:", with: @user.email
      click_on "Log In"
      expect(current_path).to eq(root_path)

      click_on "Create Athlete"
      expect(current_path).to eq(new_athlete_path)

      fill_in "NAME:", with: "Jane Doe"
      select "Female", from: "GENDER:"
      fill_in "Feet:", with: 5
      fill_in "Inches:", with: 7
      fill_in "WEIGHT:", with: 155
      fill_in "BIRTHDAY:", with: "1982-08-22"
      click_button("Add Athlete")
    
      @user.athletes.each do |athlete|
        @athlete = athlete
      end
    end
    
    it "edit athlete page: Athlete params are edited" do
      visit athlete_path(@athlete)
      expect(current_path).to eq(athlete_path(@athlete))
      expect(page).to have_link("Edit Athlete")
      
      click_link("Edit Athlete")
      expect(current_path).to eq(edit_athlete_path(@athlete))

      expect(page).to have_field("Name", with: @athlete.name)
      expect(page).to have_select("Gender", selected: @athlete.gender)
      expect(page).to have_field("Feet", with: @athlete.feet)
      expect(page).to have_field("Inches", with: @athlete.inches)
      expect(page).to have_field("Weight", with: @athlete.weight)
      expect(page).to have_field("Birthday", with: @athlete.birthday)

      fill_in("Weight", with: 195)

      click_button("Update #{@athlete.name}")

      expect(current_path).to eq(athlete_path(@athlete))
      expect(page).to have_text("Athlete successfully updated.")
      expect(current_path).to eq(athlete_path(@athlete))

      expect(page).to have_text("Weight: 195")
    end
  end

  describe "SAD PATHS" do
    before do
      @user = User.create!(
        username: "funbucket13",
        password: "test", 
        email: "funbucket@aol.com")
      
      visit login_path
      fill_in "Username:", with: @user.username
      fill_in "Password:", with: @user.password
      fill_in "Email Address:", with: @user.email
      click_on "Log In"
      expect(current_path).to eq(root_path)

      click_on "Create Athlete"
      expect(current_path).to eq(new_athlete_path)

      fill_in "NAME:", with: "Jane Doe"
      select "Female", from: "GENDER:"
      fill_in "Feet:", with: 5
      fill_in "Inches:", with: 7
      fill_in "WEIGHT:", with: 155
      fill_in "BIRTHDAY:", with: "1982-08-22"
      click_button("Add Athlete")
    
      @user.athletes.each do |athlete|
        @athlete = athlete
      end
    end

    it "athlete edit page: Athlete does not exist" do
      visit edit_athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
    
    it "edit athlete page: missing params - name" do

      visit edit_athlete_path(@athlete)

      fill_in("Name", with: "")
      select "Female", from: "Gender"
      fill_in "Feet", with: 5
      fill_in "Inches", with: 7
      fill_in "Weight", with: 155
      fill_in "Birthday", with: "1982-08-22"
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Name can't be blank")
    end

    # it "edit athlete page: missing params - gender" do #Need to add "-" to selection in order to alalow athlete to not select an option
    #   visit edit_athlete_path(@athlete)

    #   fill_in("Gender", with: "")
    #   click_button("Update #{@athlete.name}")

    #   expect(page).to have_text("Gender can't be blank")
    # end

    it "edit athlete page: missing params - Feet" do
      visit edit_athlete_path(@athlete)

      fill_in("Feet", with: "")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Feet can't be blank")
    end

    it "edit athlete page: missing params - Inches" do
      visit edit_athlete_path(@athlete)

      fill_in("Inches", with: "")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Inches can't be blank")
    end

    it "edit athlete page: missing params - weight" do
      visit edit_athlete_path(@athlete)

      fill_in("Weight", with: "")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Weight can't be blank")
    end

    it "edit athlete page: invalid params - Feet not a number" do
      visit edit_athlete_path(@athlete)

      fill_in("Feet", with: "seventy-two")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Feet is not a number")
    end

    it "edit athlete page: invalid params - Inches not a number" do
      visit edit_athlete_path(@athlete)

      fill_in("Inches", with: "seventy-two")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Inches is not a number")
    end

    it "edit athlete page: invalid params - weight not a number" do
      visit edit_athlete_path(@athlete)

      fill_in("Weight", with: "one eighty")
      click_button("Update #{@athlete.name}")

      expect(page).to have_text("Weight is not a number")
    end
  end
end