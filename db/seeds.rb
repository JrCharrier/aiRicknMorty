require 'open-uri'
require 'json'

puts "Cleaning database..."
Booking.destroy_all
Character.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(
  first_name: "Niko",
  last_name: "Nitrax",
  nickname: "Nitrax64",
  email: "user@example.com",
  password: "password"
)
user2 = User.create!(
  first_name: "Lola",
  last_name: "Benitez",
  nickname: "Choopachoops",
  email: "user_2@example.com",
  password: "password"
)

puts "Created users"

url = 'https://rickandmortyapi.com/api/character'
response = URI.open(url).read
data = JSON.parse(response)['results']

puts "Creating characters..."
characters = []
 # Store the created characters to use in bookings
descriptions = ["genius, nihilistic, chaotic scientist with a sharp tongue, a broken heart, and zero regard for rules—or the multiverse. Pure unpredictability.", "anxious, kind-hearted teenager, torn between adventure and fear, often the moral compass to Rick's chaos but constantly caught in over his head.", "bold, quick-witted teenager, fiercely independent and resourceful, balancing teen drama with a surprising knack for thriving in interdimensional chaos.", "smart, ambitious, and deeply conflicted woman, torn between her love for family, her insecurities, and her desire to prove herself.","well-meaning, insecure, and often clueless man, striving for approval while stumbling through life with a mix of naivety and persistence.", "regal yet eccentric leader, exuding grace and passion, balancing her royal duties with a fiery streak and a love for adventure.", "chaotic genetic hybrid, torn between opposing ideologies, struggling with identity, and desperate to prove his worth in a world that misunderstands him.", "stern, no-nonsense bureaucrat, embodying authority and control, yet still oozing the signature Rick arrogance and genius beneath his rigid exterior.","calculating, authoritarian leader, driven by control and secrecy, wielding power ruthlessly while hiding layers of paranoia and ambition beneath a cold demeanor.", "brooding, strong-willed hero with a tragic past, summoning ghost trains and channeling his pain into justice, passion, and occasional outbursts.", "a caricature of the iconic physicist, portrayed as brilliant yet hilariously petty, quick to anger, and ready for revenge.","kind-hearted but doomed pawn in Rick’s chaos, a butter-passing robot with existential awareness, grappling with the meaninglessness of his singular purpose.", "bizarre, googly-eyed alien, eccentric and absurd, embodying the weirdness of the multiverse with a mix of chaotic energy and comedic randomness.", "strange, alternate version of Morty, blending Morty’s trademark anxiety with alien quirks, embodying the bizarre possibilities of the multiverse.", "bizarre, alternate version of Rick, combining Rick’s signature genius and arrogance with alien traits, showcasing the multiverse's infinite weirdness."]


data.first(15).each_with_index do |character, index|
  user = index < 5 ? user1 : user2
  # Ensure description meets the minimum length requirement
  # description = "Status: #{character['status']}, Origin: #{character['origin']['name']}"
  description = descriptions[index]
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

puts "Seeding completed!"
