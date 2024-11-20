class AddBookingNumberToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :booking_number, :string
  end
end
