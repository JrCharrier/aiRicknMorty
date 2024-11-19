class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
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
