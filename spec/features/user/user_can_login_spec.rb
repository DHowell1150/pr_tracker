require "rails_helper" 

RSpec.describe "logging in" do
  it "can log in with valid credentials" do
    visit root_path
    user = User.create!(username: "funbucket13", password: "test", email: "funbucket@aol.com")

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :email, with: user.email

    click_on "Log In"
    expect(current_path).to eq(root_path)# I just changed this from login_path to root_path but the lesson had login_path. 

    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to_not have_link("Log In")
    expect(page).to_not have_link("Register as a User")
    expect(page).to have_link("Log out")
    expect(page).to have_link("Create Athlete")
  end

  it "cannot log in with bad credentails" do
    # rails server isn't acting as it should based on the test
    visit login_path
    user = User.create!(username: "funbucket13", password: "test", email: "funbucket@aol.com")

    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"
    fill_in :email, with: "funbucket@aol.com"

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("Sorry, your credentials are bad")
  end
end


