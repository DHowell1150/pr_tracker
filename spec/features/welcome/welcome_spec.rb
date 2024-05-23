require "rails_helper" 

RSpec.describe "User registration form" do
  # As a visitor
  # When I visit '/'
  # and I can click a link that says "Sign Up to Be a User"
  # and I can enter registration details in a form
  # and submit that form
  # Then I should see a welcome message with my username
  # and my user details have been saved in the database.

  it "creates new user" do
    visit root_path
    click_on "Register as a New User"

    expect(current_path).to eq(new_user_path)

    username = "funbucket13"
    password = "test"

    fill_in :user_username, with: username
    fill_in :user_password, with: password

    # fill_in "Username", with: username
    # fill_in "Password", with: password
    
    click_on "Create User"
    expect(page).to have_content("Welcome, #{username}!")
  end
end
