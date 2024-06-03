require "rails_helper"

RSpec.describe "new_athlete", type: :feature  do
  describe "athlete index page" do
    before do
      @dana = Athlete.create!(name: "Dana Howell", gender: "Female", height: 67, weight: 155, birthday: 8/22/1982)
      @stace = Athlete.create!(name: "Stacey Kessler", gender: "Female", height: 70, weight: 175, birthday: 9/6/1987)
    end

    it "displays all athletes with attributes" do
      visit new_athlete_path
      
      fill_in("Name", with: @dana.name)
      fill_in("Gender", with: @dana.gender)
      fill_in("Height", with: @dana.height)
      fill_in("Weight", with: @dana.weight)
      fill_in("Birthday", with: @dana.birthday)

      fill_in("Name", with: @stace.name)
      fill_in("Gender", with: @stace.gender)
      fill_in("Height", with: @stace.height)
      fill_in("Weight", with: @stace.weight)
      fill_in("Birthday", with: @stace.birthday)
      
      click_button("Create Athlete")
      expect(current_path).to eq(athletes_path)

      within "#athlete-#{@dana.id}" do
        expect(page).to have_content(@dana.name)
        expect(page).to have_content(@dana.gender)
        expect(page).to have_content(@dana.height)
        expect(page).to have_content(@dana.weight)
        expect(page).to have_content(@dana.birthday)
      end

      within "#athlete-#{@dana.id}" do
        expect(page).to have_content(@stace.name)
        expect(page).to have_content(@stace.gender)
        expect(page).to have_content(@stace.height)
        expect(page).to have_content(@stace.weight)
        expect(page).to have_content(@stace.birthday)
      end
    end
  end
end
