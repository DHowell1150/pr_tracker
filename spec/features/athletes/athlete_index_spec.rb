require "rails_helper"

RSpec.describe "new_athlete", type: :feature  do
  describe "athlete index page" do
    before do
      @user = User.create!(username: "Dana Howell", email: "howelld115@gmail.com", password: "test")
      @dana = @user.athletes.create!(name: "Dana Howell", gender: "Female", feet: 5, inches: 7, weight: 155, birthday: "1982-08-22") ##in pry: Sun, 22 Aug 1982
      @stace = @user.athletes.create!(name: "Stacey Kessler", gender: "Female", feet: 5, inches: 10, weight: 175, birthday: "1987-09-06")

      visit athletes_path
    end

    it "displays all athletes with attributes" do
      within "#athlete-#{@dana.id}" do
        expect(page).to have_content(@dana.name)
        expect(page).to have_content(@dana.gender)
        expect(page).to have_content(@dana.feet)
        expect(page).to have_content(@dana.inches)
        expect(page).to have_content(@dana.weight)
        expect(page).to have_content(@dana.birthday.strftime("%-m/%-d/%Y"))
      end
      within "#athlete-#{@stace.id}" do
        expect(page).to have_content(@stace.name)
        expect(page).to have_content(@stace.gender)
        expect(page).to have_content(@stace.feet)
        expect(page).to have_content(@stace.inches)
        expect(page).to have_content(@stace.weight)
        expect(page).to have_content(@stace.birthday.strftime("%-m/%-d/%Y"))
      end
    end

    it "has a link to edit athlete" do
      within "#athlete-#{@stace.id}" do
        expect(page).to have_link("Edit")
        click_on "Edit"
        expect(current_path).to eq(edit_athlete_path(@stace))
      end
    end

    it "has a link to athlete's show page" do
      within "#athlete-#{@stace.id}" do
        expect(page).to have_link("#{@stace.name}")
        click_on "#{@stace.name}"
        expect(current_path).to eq(athlete_path(@stace))
      end
    end
  end
end
