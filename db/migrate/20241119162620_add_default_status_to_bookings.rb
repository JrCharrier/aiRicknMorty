class AddDefaultStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, 'to_be_validated'
  end
end
