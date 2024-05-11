# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
lexington = City.create!({name: "Lexington", state: "Kentucky"})
durham = City.create!({name: "Durham", state:"North Carolina"})

palomar = Neighborhood.create!({name: "Palomar", city: lexington})
duke = Neighborhood.create!({name: "Duke", city: durham})

Apartment.create!({street_address: "4261 Palmetto Drive", bedrooms: 3, rent: 1000, notes: "Home Address", neighborhood: palomar, city: lexington})
Apartment.create!({street_address: "117 Edens", bedrooms: 1, rent: 200, notes: "School", neighborhood: duke, city: durham})


User.create!({ email: "will@duke", password: "secret", password_confirmation: "secret"})
User.create!({ email: "sophia@duke", password: "secret", password_confirmation: "secret"})

