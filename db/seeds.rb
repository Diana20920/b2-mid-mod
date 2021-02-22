# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
eren = Mechanic.create!(name: "Eren Jaeger", years_experience: 13)
levi = Mechanic.create!(name: "Levi Ackerman", years_experience: 25)
hange = Mechanic.create!(name: "Hange Zoe", years_experience: 30)

forest = Ride.create!(name: "Titan Forest", thrill_rating: 4)
maria = Ride.create!(name: "Retake of Wall Maria", thrill_rating: 8)
underground = Ride.create!(name: "The Underground", thrill_rating: 3)

RideMechanic.create!(mechanic: levi, ride: forest)
RideMechanic.create!(mechanic: levi, ride: maria)
RideMechanic.create!(mechanic: levi, ride: underground)
