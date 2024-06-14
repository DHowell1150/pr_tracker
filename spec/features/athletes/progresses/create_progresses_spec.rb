require "rails_helper"

RSpec.describe "Athlete_progresses show" do
  describe "HAPPY PATHS" do
    before do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      visit login_path

      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      fill_in :email, with: @user.email

      click_on "Log In"

      @athlete_1 = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
      # @athlete_2 = @user.athletes.create!(name: "Jane", gender: "Female", feet: 5, inches: 5, weight: 125, birthday: "02/02/1992")

      @movement1 = @athlete_1.movements.create!(name: "Back Squat", description: "Get Low", image: "test", video: "test")
      @movement2 = @athlete_1.movements.create!(name: "Bench Press", description: "Beach Body Galore", image: "test", video: "test")
      # @movement3 = @athlete_1.movements.create!(name: "Deadlift", description: "Bootaaay", image: test, video: "test")
      visit athlete(@athlete_1)
      click_on "Add a New Personal Record"
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end

    it "creates a new progress" do
      expect(page).to have_field('Date:')
      expect(page).to have_field('Reps:', type: "number")
      expect(page).to have_field('Weight:', type: "number")
      expect(page).to have_select('Movement:', options: ["Back Squat", "Bench Press", "Deadlift"])
      expect(page).to have_button("Add New PR")

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: "2024-06-11"
      fill_in 'Weight:', with: 255
      fill_in 'Reps:', with: 1

      click_button("Add New PR")

      expect(current_path).to eq(athlete_path(@athlete_1)) 
      expect(page).to have_text("You have a new PR.")
      expect(page).to have_content("Back Squat")
      expect(page).to have_content("Weight: 255")
      expect(page).to have_content("Reps: 1")
      expect(page).to have_content("Weight: 155lbs")
      expect(page).to have_content("Date: 6/11/2024")
    end
  end

  describe "SAD PATHS" do
    before do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      @athlete_1 = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
      # @athlete_2 = @user.athletes.create!(name: "Jane", gender: "Female", feet: 5, inches: 5, weight: 125, birthday: "02/02/1992")

      @movement1 = @athlete_1.movements.create!(name: "Back Squat", description: "Get Low", image: "test", video: "test")
      # @movement2 = @athlete_1.movements.create!(name: "Bench Press", description: "Beach Body Galore", image: "test", video: "test")
      visit new_athlete_progress_path(@athlete_1)
    end

    it "new progress page: missing params - weight" do
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: "2024-06-11"
      fill_in 'Weight:', with: ""
      fill_in 'Reps:', with: 1
      click_button "Add New PR"

      expect(page).to have_content("Weight can't be blank")
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end

    it "new progress page: missing params - reps" do
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: "2024-06-11"
      fill_in 'Weight:', with: 255
      fill_in 'Reps:', with: ""
      click_button "Add New PR"

      expect(page).to have_content("Reps can't be blank")
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end

    it "new progress page: missing params - date" do
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: ""
      fill_in 'Weight:', with: 255
      fill_in 'Reps:', with: 1
      click_button "Add New PR"

      expect(page).to have_content("Date can't be blank")
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end

    it "new progress page: invalid params - weight is not a number" do
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: "2024-06-11"
      fill_in 'Weight:', with: "Two fivty-five"
      fill_in 'Reps:', with: 1
      click_button "Add New PR"

      expect(page).to have_content("Weight is not a number")
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end

    it "new progress page: invalid params - reps is not a number" do
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))

      select 'Back Squat', from: 'Movement:'
      fill_in 'Date:', with: "2024-06-11"
      fill_in 'Weight:', with: 255
      fill_in 'Reps:', with: "One"
      click_button "Add New PR"

      expect(page).to have_content("Weight is not a number")
      expect(current_path).to eq(new_athlete_progress_path(@athlete_1))
    end
  end
end
