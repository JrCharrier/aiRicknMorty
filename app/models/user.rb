class User < ApplicationRecord
  has_many :characters
  has_many :bookings
  has_one_attached :avatar


  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations des autres attributs
  validates :first_name, :last_name, presence: true
  validates :nickname, presence: true, length: { in: 3..50 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_blank: true
#   validate  :avatar_format

# private

#   def avatar_format
#     if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
#       errors.add(:avatar, 'must be a JPEG or PNG')
#     elsif avatar.attached? && avatar.byte_size > 100.megabytes
#       errors.add(:avatar, 'size should be less than 5MB')
#     end
#   end
end
