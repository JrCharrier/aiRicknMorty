# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

url = 'https://rickandmortyapi.com/api/character'

puts "Fetching characters from Rick and Morty API..."

response = URI.open(url).read

data = JSON.parse(response)['results']

data.each do |character|
  Character.create(
    name: character['name'],
    description: character['status'],
    gender: character['gender'],
    planet: character['location']['name'],
    image_url: character['image'],
    price: rand(10..100)
  )
  puts "Created character: #{character['name']}"
end

puts "Seeding completed!"
