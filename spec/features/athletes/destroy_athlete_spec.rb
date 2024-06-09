require "rails_helper"

RSpec.describe "destroy_athlete", type: :feature  do
  describe "HAPPY PATHS" do
    it "destroy athlete: Athlete is deleted" do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = @user.athletes.create!(name: "John", gender: "Male", feet: 5, inches: 7, weight: 200, birthday: "01/01/1991")

      visit athlete_path(athlete)

      expect(current_path).to eq(athlete_path(athlete))

      expect(page).to have_button("Delete #{athlete.name}")
      
      click_button("Delete #{athlete.name}")
      expect(current_path).to eq(athletes_path)

      expect(page).to have_text("Athlete successfully deleted")
    end
  end

  describe "SAD PATHS" do
    it "athlete destroy page: Athlete does not exist" do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      visit athlete_path(id: 9999)

      expect(page).to have_text("Athlete not found.")
    end
  end
end