




























# it "can create a movement" do
#   visit athlete_path(@athlete) 
#   click_link "Create New Movement"
#   expect(current_path).to eq(new_movement_path(@athlete))
#   expect(page).to have_select('Name:', options: ["Pullups", 
#                                                       "Olympic Squat", 
#                                                       "Dumbbell Bench Press", 
#                                                       "Clean and jerk", 
#                                                       "Barbell Deadlift"
#                                                     ])
#   expect(page).to have_field("Date:", type: "date")
#   expect(page).to have_field("Reps:")
#   expect(page).to have_field("Weight")
#   expect(page).to have_button("Add Movement")

#   select "Olympic Squat", from: "Name:"
#   fill_in "Date:", with: "2024-06-11"
#   fill_in "Reps:", with: 1
#   fill_in "Weight:", with: 255

#   click_button "Add Movement"
#   expect(current_path).to eq(athlete_path(@athlete))
#   #build a div block in athletes/show.html.erb
#   within '.movement' do
#     expect(page).to have_content("Olympic Squat")
#     expect(page).to have_content("2024-06-11")
#     expect(page).to have_content(1)
#     expect(page).to have_content(255)
#   end
# end