require 'rails_helper'

RSpec.describe 'Athlete Show', type: :feature do
  describe ' as a user/admin when I visit /path' do
    before(:each) do
      @user = User.create!(username: "Dana Howell", email: "howelld115@gmail.com", password: "test")

      @stace = @user.athletes.create!(name: "Stacey Kessler", gender: "Female", feet: 5, inches: 10, weight: 175, birthday: "1987-09-06")
      visit athlete_path(@stace)
    end

    it 'displays athlete name and movements' do
      expect(page).to have_content(@stace.name)
      expect(page).to have_content("Height: 5'10")
      expect(page).to have_content(@stace.weight)
      expect(page).to have_content(@stace.birthday.strftime("%-m/%-d/%Y"))
      expect(page).to have_link("Progress")
    end

    it "has a link to edit athlete" do
      expect(page).to have_link("Edit")
  
      click_link "Edit"
  
      expect(current_path).to eq(edit_athlete_path(@stace))
    end

    it "has a link to Progress" do
      expect(page).to have_link("Progress")
  
      click_on "Progress"
  
      expect(current_path).to eq(athlete_path(@stace))
    end
  end
end