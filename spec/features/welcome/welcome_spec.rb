require "rails_helper" 

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path
    expect(page).to have_link("Register as a New User")
    expect(page).to have_link("Log In")
    click_on "Register as a New User"

    expect(current_path).to eq(new_user_path)

    username = "funbucket13"
    password = "test"
    email = "funbucket@aol.com"

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    fill_in :user_email, with: email

    click_on "Create User"

    # expect(current_path).to eq(root_path)
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Welcome, #{username}! Please Log In")

    expect(page).to have_field(:username)
    expect(page).to have_field(:password)
    expect(page).to have_field(:email)

    fill_in :username, with: "funbucket13"
    fill_in :password, with: "test"
    fill_in :email, with: "funbucket@aol.com"

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Logged in as #{username}")
    expect(page).to have_link("Log out")
    expect(page).to have_link("Create Athlete")
  end
end
