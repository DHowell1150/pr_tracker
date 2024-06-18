require "rails_helper"

RSpec.describe "Movement create", type: :feature do
  describe "HAPPY PATHS" do
    before do
    # include_context 'login_as_user'
    # let(:user) {create(:user)}
      visit login_path
      @user = User.create!(
        username: "funbucket13",
        password: "test", 
        email: "funbucket@aol.com")
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      fill_in :email, with: @user.email
      click_on "Log In"
      expect(current_path).to eq(root_path)
  
      # login_as_user
      @athlete = @user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")
    end

    it "can create a movement" do
      visit athlete_path(@athlete) 
      click_link "Create New Movement"
      expect(current_path).to eq(new_athlete_movement_path(@athlete))
      expect(page).to have_select('Name:', options: ["Pullups", 
                                                          "Olympic Squat", 
                                                          "Dumbbell Bench Press", 
                                                          "Clean and jerk", 
                                                          "Barbell Deadlift"
                                                        ])
      expect(page).to have_field("Description:")
      expect(page).to have_field("Image:")
      expect(page).to have_field("Video:")
      expect(page).to have_button("Add Movement")

      select "Olympic Squat", from: "Name:"
      fill_in "Description:", with: "A description"
      fill_in "Image:", with: "image_url"
      fill_in "Video:", with: "video_url"

      click_button "Add Movement"
      expect(current_path).to eq(athlete_path(@athlete))
      within '.movement' do
        expect(page).to have_content("Olympic Squat")
        expect(page).to have_content("A description")
        expect(page).to have_content("image_url")
        expect(page).to have_content("video_url")
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