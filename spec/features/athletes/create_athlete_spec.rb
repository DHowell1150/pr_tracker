require "rails_helper"

RSpec.describe "new_athlete", type: :feature  do
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
      visit new_athlete_path
    end

    it "new athlete page: Creates a new athlete" do
      expect(page).to have_field('NAME:')
      expect(page).to have_select('GENDER:', options: ["Male", "Female", "Unspecified"])
      expect(page).to have_field('Feet:', type: "number")
      expect(page).to have_field('Inches:', type: "number")
      expect(page).to have_field('BIRTHDAY:', type: "date")
      expect(page).to have_button("Add Athlete")

      fill_in 'NAME:', with: "Jane Doe"
      select 'Female', from: 'GENDER:'
      fill_in 'Feet:', with: "5"
      fill_in 'Inches:', with: "7"
      fill_in 'WEIGHT:', with: "155"
      fill_in 'BIRTHDAY:', with: "1982-08-22" #May need to adjust this. Desired format: strftime("%-d/%-m/%Y")   8/22/1982

      click_button("Add Athlete")

      expect(current_path).to eq(athletes_path) 
      expect(page).to have_text("Athlete created successfully.")
      expect(page).to have_content("Jane Doe")
      expect(page).to have_content("Gender: Female")
      expect(page).to have_content("Height: 5'7")
      expect(page).to have_content("Weight: 155lbs")
      expect(page).to have_content("Birthday: 8/22/1982")
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