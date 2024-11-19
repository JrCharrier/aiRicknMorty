class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :gender, :image_url, :price,  presence: true
  validates :description, length: { minimum: 10 }
  PLANETS = [
    "Earth (C-137)",
    "Abadango",
    "Citadel of Ricks",
    "Worldender's Lair",
    "Anatomy Park",
    "Interdimensional Cable",
    "Immortality Field Resort",
    "Post-Apocalyptic Earth",
    "Purge Planet"
  ]
end
