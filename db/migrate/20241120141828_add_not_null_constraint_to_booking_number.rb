class AddNotNullConstraintToBookingNumber < ActiveRecord::Migration[7.1]
  def change
    change_column_null :bookings, :booking_number, false
  end
end
