require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  describe 'When I visit a mechanic show page' do
    it "I see their name and years of experience" do
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)

      visit mechanic_path(levi)

      expect(page).to have_content("Mechanic:")
      expect(page).to have_content(levi.name)
      expect(page).to have_content("Years of Experience:")
      expect(page).to have_content(levi.years_experience)
    end

    it "And I see the names of all rides they're working on " do
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)

      forest = Ride.create!(name: "Titan Forest", thrill_rating: 4)
      maria = Ride.create!(name: "Retake of Wall Maria", thrill_rating: 8)
      underground = Ride.create!(name: "The Underground", thrill_rating: 3)

      RideMechanic.create!(mechanic: levi, ride: forest)
      RideMechanic.create!(mechanic: levi, ride: maria)
      RideMechanic.create!(mechanic: levi, ride: underground)

      visit mechanic_path(levi)

      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content("Titan Forest")
      expect(page).to have_content("Retake of Wall Maria")
      expect(page).to have_content("The Underground")
    end

    it "And I only see the rides that are open" do
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)

      forest = Ride.create!(name: "Titan Forest", thrill_rating: 4, open: true)
      maria = Ride.create!(name: "Retake of Wall Maria", thrill_rating: 8, open: false)
      underground = Ride.create!(name: "The Underground", thrill_rating: 3, open: true)

      RideMechanic.create!(mechanic: levi, ride: forest)
      RideMechanic.create!(mechanic: levi, ride: maria)
      RideMechanic.create!(mechanic: levi, ride: underground)

      visit mechanic_path(levi)

      expect(page).to have_content("Titan Forest")
      expect(page).to have_content("The Underground")
      expect(page).to_not have_content("Retake of Wall Maria")
    end
  end
end
