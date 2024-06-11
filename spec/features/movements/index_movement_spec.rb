require "rails_helper"

RSpec.describe "index_movement", type: :feature do
  describe "HAPPY PATHS" do
    it "displays movements with params" do
      user = User.create!(username: "funbucket13", email: "test@test.com", password: "test")
      athlete = user.athletes.create!(name: "John", gender: "Male", feet: 6, inches: 0, weight: 200, birthday: "01/01/1991")

      movement1 = athlete.movements.create!(name: "Squat", description: "Get low", image: "test", video: "test")
      movement2 = athlete.movements.create!(name: "Bench Press", description: "Beach muscle galore", image: "test", video: "test")
      movement3 = athlete.movements.create!(name: "Deadlift", description: "Bootaaay", image: "test", video: "test")

      visit movements_path

      within "#movement-#{movement1.id}" do
        expect(page).to have_content(movement1.name)
        expect(page).to have_content(movement1.description)
        expect(page).to have_content(movement1.image)
        expect(page).to have_content(movement1.video)
        # <%= movement.instructions.first if movement.instructions.present?%>
      end

      within "#movement-#{movement2.id}" do
        expect(page).to have_content(movement2.name)
        expect(page).to have_content(movement2.description)
        expect(page).to have_content(movement2.image)
        expect(page).to have_content(movement2.video)
                # <%= movement.instructions.first if movement.instructions.present?%>

      end

      within "#movement-#{movement3.id}" do
        expect(page).to have_content(movement3.name)
        expect(page).to have_content(movement3.description)
        expect(page).to have_content(movement3.image)
        expect(page).to have_content(movement3.video)
                # <%= movement.instructions.first if movement.instructions.present?%>

      end
    end
  end
end