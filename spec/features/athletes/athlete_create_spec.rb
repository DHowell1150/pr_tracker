require "rails_helper"

RSpec.describe "create athlete " do
  before do 
    @user = User.create!(
      username: "funbucket13",
      password: "test", 
      email: "funbucket@aol.com")

    visit login_path

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password
    fill_in :email, with: @user.email

    click_on "Log In"
    expect(current_path).to eq(root_path)
    visit new_athlete_path
  end

  it "can create a new athlete after having logged in as a user." do
    
    expect(page).to have_field('NAME:')
    expect(page).to have_select('GENDER:', options: ["Male", "Female", "Unspecified"])
    expect(page).to have_field('Feet:', type: "number")
    expect(page).to have_field('Inches:', type: "number")
    expect(page).to have_field('BIRTHDAY:', type: "date")
    expect(page).to have_button("Add Athlete")

    fill_in 'NAME:', with: "Jane Doe"
    select 'Female', from: 'GENDER:'
    fill_in 'Feet:', with: "5"
    fill_in 'Inches:', with: "7"
    fill_in 'WEIGHT:', with: "155"
    fill_in 'BIRTHDAY:', with: "1982-08-22" #May need to adjust this. Desired format: strftime("%-d/%-m/%Y")
    
    click_button "Add Athlete"
    expect(current_path).to eq(athletes_path) 
    expect(page).to have_content("Jane Doe")
    expect(page).to have_content("Gender: Female")
    expect(page).to have_content("Height: 5'7")
    expect(page).to have_content("Weight: 155lbs")
    expect(page).to have_content("Birthday: 8/22/1982")
  end
end