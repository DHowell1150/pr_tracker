require "rails_helper" 

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path
    expect(page).to have_link("Register as a User")
    expect(page).to have_link("Log In")
    click_on "Register as a New User"

    expect(current_path).to eq(new_user_path)

    username = "funbucket13"
    password = "test"
    email = "funbucket@aol.com"

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_email, with: email

    # fill_in "Username", with: username
    # fill_in "Password", with: password
    
    click_on "Create User"
    expect(page).to have_content("Welcome, #{username}!")
    expect(page).to have_link("Log out")
    expect(page).to have_link("Create Athlete")
  end

  it "has a Create Athete link" do
    click_link "Create Athlete"
    expect(current_path).to eq(new_athlete_path)
  end

  # it "has a Log Out link" do  #is this a destroy/delete function?
  #   click_link "Log out"

  #   expect(current_path).to eq(root_path)
  #   expect(page).to have_link("Register as a User")
  #   expect(page).to have_link("Log In")
  # end
end
