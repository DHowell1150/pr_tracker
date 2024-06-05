require 'rails_helper'

RSpec.describe 'edit athlete', type: :feature do
  describe ' USER STORY #' do
    describe ' as a user/admin when I visit edit_athlete_path' do
      before(:each) do
        @user = User.create!(username: "Dana Howell", email: "howelld115@gmail.com", password: "test")

        @stace = @user.athletes.create!(name: "Stacey Kessler", gender: "Female", feet: 5, inches: 10, weight: 175, birthday: "1987-09-06")
        visit edit_athlete_path(@stace)
      end
      it 'displays' do
        visit athlete_path(@stace)
        expect(page).to have_content("Weight: 175")

        click_link "Edit"
        expect(current_path).to eq(edit_athlete_path(@stace))
        
        expect(page).to have_field("Name", with: @stace.name)
        expect(page).to have_select("Gender", selected: @stace.gender)
        expect(page).to have_field("Feet", with: @stace.feet)
        expect(page).to have_field("Inches", with: @stace.inches)
        expect(page).to have_field("Weight", with: @stace.weight)
        expect(page).to have_field("Birthday", with: @stace.birthday)

        fill_in 'Weight', with: 179

        click_button "Update #{@stace.name}"
        expect(current_path).to eq(athlete_path(@stace))
        expect(page).to have_content("Weight: 179")
      end
    end 
  end
end