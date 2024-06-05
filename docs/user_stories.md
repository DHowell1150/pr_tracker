**QUESTIONS:**
- Do I need a sign up page? Or just stick with login? _easiest to make a welcome page with both forms on it_
- Do I need an athlete index page? _Yep!_

# USER STORIES

> ## LOGIN
- US1 sign up 
  - As a prospective user, 
  - when I visit the welcome page
  - I see a form to sign up
  - That has name, password, password_confirmation, and a button to "Create New User".
  - When I fill that out and click "Create New User",
  - I am redirected to new_athlete_path (might be easier to go to the Athlete Dashboard, which would be empty of athletes, but has a button/form to create new athlete)

- US1 Sad Paths: missing params (e.g. name can't be blank, password can't be blank, passwords don't match)

- US2
  - As a current user,
  - When I visit the welcome page,
  - I see a place to enter my name and password.
  - When I enter my credentials
  - and click on login with correct credentials
  - I am redirected to the athlete dashboard

- US2 Login sad path
  - as a user, 
  - when I enter the incorrect name....
  - I see a message "Name is not valid"
  - I am redirected to welcome page
  (with name still in the field?) <- easier to allow it to refresh the page, so it would be blank

- US3 Login sad path
  - as a user, 
  - when enter the incorrect password
  - I see a message "Password is incorrect"
  - I am redirected to the welcome page

> ## New_athlete_page sign-up
- US4 Create Athlete sign up
  - As a user
  - When I visit new_athlete_path
  - I see a form to enter my:
    - name (text field) 
    - gender (drop down [m/f/unspecified])
    - height (num field)   (range 0..999)
    - weight (num field)   (range 0..999)
    - birthday (date field)  strftime("%-d/%-m/%Y")
  - And a button to "Add Athlete"
  - When I click "Add Athlete"
  - I am redirected to Dashboard_path

* sad paths = missing params, outside of range

 ## EDIT ATHLETE
- US
  - As a user,
  - when I visit edit_athlete_path
  - I see athlete_name and a place to update:
    - Name: textfield
    - Gender: Drop down
    - Height: (inches): num_field
    - Weight: (lbs)(edit_button)
    - Birthday: date
  - When I click "Save" I am redirected to athlete_path(@athlete)

> ## DASHBOARD/SHOW
- I can really see the dashboard wrapping everything together and making the information really nice! (Can save it for after all the other pages are made)
- US User Dashboard
  - as a user,
  - When I visit my dashboard
  - I see my athletes' and their:
    - name
    - gender
    - height
    - weight
    - birthday

- US See Progress (I think this would be to see the movements, and their progress)
  - When I am on my dashboard,
  - I see a button to "See Progress"
  - When I click on the button "See Progress"
  - I am redirected to the progress index page

- US Edit Athlete
  - When I am on my dashboard,
  - I see the "Edit My Profile" button
  - When I click the "Edit My Profile" button
  - I am redirected to edit_athlete_path

 ## MOVEMENT INDEX
- US  Movement names
  - As a user,
  - when I visit movements_path
  - I see a list of all the movements listed by name alphabetically
  - And I see that each movement is a link to its show page

- US Movement page video and description
  - As a user,
  - When I am on movements_path
  - I see a short description and video under each movement name

- US movement index to show link (this looks like the US Movement names)
  - As a user on the movements_path
  - When I click on the movement link,
  - I am directed to the movement show page

- US
  - As a user,
  - when I visit movements_path
  - I see a button to "Add a Movement"
  - When I click that "Add a Movement", I am directed to the edit_movement_path

- __All that follows below would change based on what we discussed this morning (e.g. taking progress out of movement)__

 ## MOVEMENT SHOW
- US
  - As a user,
  - when I visit movement_path
  - I see
    - "Movement Name"
    - "Date" of latest PR
    - "Weight" of latest PR
    - "Reps" of latest PR
    - "1RM Goal Weight" Shows only if athlete has one
    - "NOTES" as a large text field

- US
  - As a user,
  - when I visit movement_path
  - I see a button to "Add New PR"
  - When I click "Add New PR"
  - I am taken to new_movement_path


 ## CREATE MOVEMENT 
- US Create Movement
  - As a user,
  - when I visit new_movement_path
  - I see a place to add:
    - "Movement Name"
    - "Date" 
    - "Weight" 
    - "Reps" 
    - "1RM Goal Weight" (can leave empty)
    - "Notes (optional)
  - I see a button to "Save Movement"
  - When I click "Save Movement", I am taken back to movements_path


## EDIT MOVEMENT
- US
  - As a user,
  - when I visit edit_movement_path
  - I see a movement_name and a place to update:
    - "Name"
    - "Date" of latest PR
    - "Weight" of latest PR
    - "Reps" of latest PR
    - "1RM Goal Weight"
    - "Notes"
  - When I click "Save Movement" I am redirected to movement_path
  - 