require "rails_helper"

RSpec.describe "create athlete " do
  before do 
    @user = User.create!(
      username: "funbucket13",
      password: "test", 
      email: "funbucket@aol.com")

    @athlete = @user.athletes.create!(
      name: "Jane Doe", 
      gender: "Female", 
      birthday: "1982-08-22",
      height: 67,
      weight: 155)
        
    visit new_athlete_path
  end

  it "can create a new athete after having logged in as a user." do
    # - As a current user
    # - When I visit new_athlete_path
    # - I see a form to enter my:
    #   - name (text field) 
    #   - gender (drop down [m/f/unspecified])
    #   - height (num field)
    #   - weight (num field)
    #   - birthday (date field)  strftime("%-d/%-m/%Y")
    # - And a button to "Add Athlete"
    # - When I click "Add Athlete"
    # - I am redirected to Dashboard_path


    # fill_in "Username", with: @user.username
    # fill_in "Password", with: @user.password
    # click_button "Log In"
    # expect(current_path).to eq(root_path)

    # click_link "Create Athlete"

    # expect(current_path).to eq(new_athlete_path)
    expect(page).to have_field("Name")
    expect(page).to have_select(:gender, options: ["Male", "Female", "Unspecified"])
    expect(page).to have_field("Height", type: "number")
    expect(page).to have_field("Weight", type: "number")
    expect(page).to have_field("Birthday", type: "date")
    expect(page).to have_button("Add Athlete")

    fill_in "Name", with: "Jane Doe"
    select "Female", from: "Gender"
    fill_in "Height", with: "67"
    fill_in "Weight", with: "155"
    fill_in "Birthday", with: "1982, 08, 22" #May need to adjust this. Desired format: strftime("%-d/%-m/%Y")

    click_on "Add Athlete"

    expect(current_path).to eq(athletes_path) 

    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("Gender: Female")
    expect(page).to have_content("Height: 67") #Refactor this to height and inches
    expect(page).to have_content("Weight: 155")
    expect(page).to have_content("Birthday: 8/22/1982")
  end
end
