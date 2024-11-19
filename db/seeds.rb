require 'open-uri'
require 'json'

puts "Cleaning database..."
Booking.destroy_all
Character.destroy_all
User.destroy_all

puts "Creating users..."
user = User.create!(
  email: "user@example.com",
  password: "password"
)
puts "Created user: #{user.email}"

url = 'https://rickandmortyapi.com/api/character'
response = URI.open(url).read
data = JSON.parse(response)['results']

puts "Creating characters..."
data.first(15).each do |character|
  user.characters.create!(
    name: character['name'],
    description: character['status'],
    gender: character['gender'],
    planet: character['location']['name'],
    image_url: character['image'],
    price: rand(10..100)
  )
  puts "Created character: #{character['name']}" # Fix output variable
end

puts "Seeding completed!"
