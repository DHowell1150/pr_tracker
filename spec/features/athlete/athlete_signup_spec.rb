require "rails_helper"

RSpec.describe "new_athlete " do
  it "can create a new athete" do
    # - As a user
    # visit athlete_path(@athlete)
    # - When I visit new_athlete_path
    # - I see a form to enter my:
    #   - name (text field) 
    #   - gender (drop down [m/f/unspecified])
    #   - height (num field)   (range 0..999)
    #   - weight (num field)   (range 0..999)
    #   - birthday (date field)  strftime("%-d/%-m/%Y")
    # - And a button to "Add Athlete"
    # - When I click "Add Athlete"
    # - I am redirected to Dashboard_path
  end
end

# 1. Register as a user
#   "root_path"
#     Click "Register as a New User"

#   "users/new"
#   UN, PW, email -> "create user"
#   => "Welcome, #{username}.  Log in!" back on root_path

