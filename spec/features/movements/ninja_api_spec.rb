require 'rails_helper'

feature "user can search for members" do

  scenario "user submits valid movement name" do
    # As a user
    # When I visit "/"
    visit '/api_ninjas'

    select "Bench", from: :movement
    # And I select "Colorado" from the dropdown
    click_on "Submit"
    # And I click on "Locate Representatives"
    expect(current_path).to eq(search_path)
    # I should see a list the members for Colorado

    within(first(".movement")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".instructions")
    end
    # And I should see a name, role, party, and state for each member
  end
end