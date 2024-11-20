require 'open-uri'
require 'json'



puts "Cleaning database..."
Booking.destroy_all
Character.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(
  email: "user@example.com",
  password: "password"
)
user2 = User.create!(
  email: "user_2@example.com",
  password: "password"
)

puts "Created users"

url = 'https://rickandmortyapi.com/api/character'
response = URI.open(url).read
data = JSON.parse(response)['results']

puts "Creating characters..."
p data.first
data.first(15).each_with_index do |character, index|
  if index < 5
    user = user1
  else
    user = user2
  end
  user.characters.create!(
    name: character['name'],
    description: ['status'],
    gender: character['gender'],
    planet: character['location']['name'],
    image_url: character['image'],
    price: rand(10..100)
  )
  puts "Created character: #{character['name']}" # Fix output variable
end

puts "Seeding completed!"

# def all_planets
#   url = 'https://rickandmortyapi.com/api/location'
#  planets = []

#   response = URI.open(url).read
#   data = JSON.parse(response)

#   planets.concat(data['results'].map { |location| location['name'] })

# end
# PLANETS = all_planets
# puts PLANETS
