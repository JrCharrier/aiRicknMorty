class AddBookingNumberToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :booking_number, :string
    add_index :bookings, :booking_number, unique: true
  end
end
