require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  describe 'When I visit the mechanics index page' do
    it "Contains a header saying 'All Mechanics'" do
      visit mechanics_path

      expect(page).to have_content("All Mechanics")
    end

    it "Lists all of the mechanic's names and their years of experience" do

      eren = Mechanic.create!(name: "Eren Jaeger", years_experience: 13)
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)
      hange = Mechanic.create!(name: "Hange Zoe", years_experience: 30)
      visit mechanics_path

      expect(page).to have_content(eren.name)
      expect(page).to have_content(eren.years_experience)
      expect(page).to have_content(levi.name)
      expect(page).to have_content(levi.years_experience)
      expect(page).to have_content(hange.name)
      expect(page).to have_content(hange.years_experience)
    end

    it "I see the average years of experience across all mechanics" do
      eren = Mechanic.create!(name: "Eren Jaeger", years_experience: 13)
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)
      hange = Mechanic.create!(name: "Hange Zoe", years_experience: 30)

      visit mechanics_path

      expect(page).to have_content(22)
    end
  end
end
