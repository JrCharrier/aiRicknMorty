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
characters = [] # Store the created characters to use in bookings

data.first(15).each_with_index do |character, index|
  user = index < 5 ? user1 : user2
  # Ensure description meets the minimum length requirement
  description = "Status: #{character['status']}, Origin: #{character['origin']['name']}"

  new_character = user.characters.create!(
    name: character['name'],
    description: description,
    gender: character['gender'],
    planet: character['location']['name'],
    image_url: character['image'],
    price: rand(10..100)
  )
  characters << new_character
  puts "Created character: #{character['name']}"
end

puts "Creating bookings..."
10.times do
  Booking.create!(
    start_date: Date.today + rand(1..10).days,
    end_date: Date.today + rand(11..20).days,
    status: ["to_be_validated", "approved", "declined"].sample,
    user: user1,
    character: characters.sample,
    booking_number: "#{('A'..'Z').to_a.sample}#{rand(1000..9999)}#{rand(1000..9999)}"
  )
  Booking.create!(
    start_date: Date.today + rand(1..10).days,
    end_date: Date.today + rand(11..20).days,
    status: ["to_be_validated", "approved", "declined"].sample,
    user: user2,
    character: characters.sample,
    booking_number: "#{('A'..'Z').to_a.sample}#{rand(1000..9999)}#{rand(1000..9999)}"
  )
end

puts "Seeding completed!"
