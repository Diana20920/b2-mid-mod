require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  describe 'When I visit the mechanics index page' do
    it "Contains a header saying 'All Mechanics'" do
      visit mechanics_path

      expect(page).to have_content("All Mechanics")
    end

    it "Lits all of the mechanic's names and their years of experience" do
      visit mechanics_path

      eren = Mechanic.create!(name: "Eren Jaeger", years_experience: 13)
      levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)
      hange = Mechanic.create!(name: "Hange Zoe", years_experience: 30)
      # 
      # expect(page).to have_content("Eren Jaeger")
      # expect(page).to have_content(13)
      expect(page).to have_content(levi.name)
      expect(page).to have_content(levi.years_experience)
      expect(page).to have_content(hange.name)
      expect(page).to have_content(hange.years_experience)
    end
  end
end
