class User < ApplicationRecord
  has_many :characters
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, :last_name

  def owns?(character)
    self.characters.pluck(:id).include?(character.id)
  end
end
