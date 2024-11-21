class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :gender, :image_url, :price, presence: true
  validates :description, length: { minimum: 10 }
  GENDERS = [
    "Female",
    "Male",
    "Genderless",
    "Unknown"
  ]

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

  def available?(start_date, end_date)
    bookings.where('start_date < ? AND end_date > ?', end_date, start_date).empty?
  end
end
