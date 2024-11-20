class FillBookingNumbers < ActiveRecord::Migration[7.1]
  def up
    Booking.find_each do |booking|
      booking.update(booking_number: "#{('A'..'Z').to_a.sample}#{rand(1000..9999)}#{booking.id}")
    end
  end

  def down
    # Ce code sert à annuler la migration si nécessaire. Tu peux laisser vide.
  end
end
