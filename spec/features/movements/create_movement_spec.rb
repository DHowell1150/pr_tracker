require "rails_helper"

RSpec.describe "Movement create", type: :feature do
  describe "HAPPY PATHS" do
    before do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      
      visit login_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      fill_in :email, with: @user.email
      click_on "Log In"
      expect(current_path).to eq(root_path)
      
      @athlete = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
    end

    it "can create a movement" do
      visit athlete_path(@athlete) 
      click_link "Create New Movement"
      expect(current_path).to eq(new_movement_path(@athlete))
      expect(page).to have_select('Movement:', options: ["Pullups", 
                                                          "Olympic Squat", 
                                                          "Dumbbell Bench Press", 
                                                          "Clean and jerk", 
                                                          "Barbell Deadlift"
                                                        ])
      expect(page).to have_field("Date:", type: "date")
      expect(page).to have_field("Reps:")
      expect(page).to have_field("Weight")
      expect(page).to have_button("Add Movement")

      select "Olympic Squat", from: "Movement:"
      fill_in "Date:", with: "2024-06-11"
      fill_in "Reps:", with: 1
      fill_in "Weight:", with: 255

      click_button "Add Movement"
      expect(current_path).to eq(athlete_path(@athlete))
      #build a div block in athletes/show.html.erb
      within '.movement' do
        expect(page).to have_content("Olympic Squat")
        expect(page).to have_content("2024-06-11")
        expect(page).to have_content(1)
        expect(page).to have_content(255)
      end
    end
  end

  describe "SAD PATHS" do
    before do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      @athlete = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      visit athlete_path(@athlete)
      click_link "Create New Movement"
      expect(current_path).to eq(new_movement_path(@athlete_1))
      visit new_movement_path(@athlete_1) # This is redundant
    end
  end

end