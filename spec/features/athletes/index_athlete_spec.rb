require "rails_helper"

RSpec.describe "index_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    before do 
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      @athlete_1 = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      @athlete_2 = @user.athletes.create!(name: "Jane", gender: "Female", feet: 5, inches: 5, weight: 125, birthday: "02/02/1992")
      
      visit athletes_path
    end

    it "athlete index page: Athlete is displayed with params" do
      expect(current_path).to eq(athletes_path)
      
      within "#athlete-#{@athlete_1.id}" do
        expect(page).to have_content(@athlete_1.name)
        expect(page).to have_content(@athlete_1.gender)
        expect(page).to have_content(@athlete_1.feet)
        expect(page).to have_content(@athlete_1.inches)
        expect(page).to have_content(@athlete_1.weight)
        expect(page).to have_content(@athlete_1.birthday.strftime("%-m/%-d/%Y"))
      end

      within "#athlete-#{@athlete_2.id}" do
        expect(page).to have_content(@athlete_2.name)
        expect(page).to have_content(@athlete_2.gender)
        expect(page).to have_content(@athlete_2.feet)
        expect(page).to have_content(@athlete_2.inches)
        expect(page).to have_content(@athlete_2.weight)
        expect(page).to have_content(@athlete_2.birthday.strftime("%-m/%-d/%Y"))
      end

    end

    it "has a link to edit athlete" do
      within "#athlete-#{@athlete_1.id}" do
        expect(page).to have_link("Edit Athlete")
        click_on "Edit Athlete"
        expect(current_path).to eq(edit_athlete_path(@athlete_1))
      end

      visit athletes_path

      within "#athlete-#{@athlete_2.id}" do
        expect(page).to have_link("Edit Athlete")
        click_on "Edit Athlete"
        expect(current_path).to eq(edit_athlete_path(@athlete_2))
      end
    end

    it "has a link to athlete's show page" do
      within "#athlete-#{@athlete_1.id}" do
        expect(page).to have_link("#{@athlete_1.name}")
        click_on "#{@athlete_1.name}"
        expect(current_path).to eq(athlete_path(@athlete_1))
      end

      visit athletes_path
      
      within "#athlete-#{@athlete_2.id}" do
        expect(page).to have_link("#{@athlete_2.name}")
        click_on "#{@athlete_2.name}"
        expect(current_path).to eq(athlete_path(@athlete_2))
      end
    end

  describe "user has no athletes" do
    xit "athlete index page: Displays no athletes message when none exist" do
      # user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      expect(current_path).to eq(athletes_path)

      expect(page).to have_text("No athletes found.")
      expect(page).to have_link("Create Athlete")

      click_link("Create Athlete")

      expect(current_path).to eq(new_athlete_path)
    end
  end
  end

  # I can't think of any SAD PATHS for this feature.
end