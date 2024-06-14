require "rails_helper"

RSpec.describe "Athlete_progresses show" do
  describe "HAPPY PATHS" do
    it "displays athlete_progresses and attributes" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")

      athlete_1 = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
      # @athlete_2 = @user.athletes.create!(name: "Jane", gender: "Female", feet: 5, inches: 5, weight: 125, birthday: "02/02/1992")

      movement1 = athlete_1.movements.create!(name: "Squat", description: "Get Low", image: "test", video: "test")
      movement2 = athlete_1.movements.create!(name: "Bench Press", description: "Beach Body Galore", image: "test", video: "test")
      movement3 = athlete_1.movements.create!(name: "Deadlift", description: "Bootaaay", image: test, video: "test")

      progress = @athlete_1.progresses.create!(date: 6-11-2024, reps: 1, weight: 255)

      visit progress_path(progress, athlete_1)

      expect(page).to have_content(progress.date)
      expect(page).to have_content(progress.reps)
      expect(page).to have_content(progress.weight)
    end
  end

  describe "SAD PATHS" do
    before do
      @user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      @athlete_1 = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
      # @athlete_2 = @user.athletes.create!(name: "Jane", gender: "Female", feet: 5, inches: 5, weight: 125, birthday: "02/02/1992")
      @movement1 = @athlete_1.movements.create!(name: "Squat", description: "Get Low", image: "test", video: "test")
    end

    xit "No Progress data for this athlete yet" do
      expect(current_path).to eq(athlete_path(@athlete_1))

      visit progress_path(id: 9999)
      expect(page).to have_content("No Progress To Show For This Athlete Yet")
    end

    xit "Date is not present" do
      progress = athlete_1.progresses.create!(date: "", reps: 1, weight: 255)
      
    end
    xit "reps is not valid" do

    end
    xit "reps is not valid" do

    end
    xit "weight is not valid" do

    end
    xit "weight is not valid" do

    end
  end
end
