require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    describe '::avg_yrs_xp' do
      it "averages all mechanics' years of experience from mechanics index page" do
        eren = Mechanic.create!(name: "Eren Jaeger", years_experience: 13)
        levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)
        hange = Mechanic.create!(name: "Hange Zoe", years_experience: 30)
        mechanics = Mechanic.all

        expect(Mechanic.avg_yrs_xp.to_i).to eq(22)
      end
    end
  end
end
