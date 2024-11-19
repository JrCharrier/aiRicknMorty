class BookingsController < ApplicationController
  before_action :set_character

  def create
    @booking = @character.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to character_path(@character), notice: "Booking successfully created"
    else
      redirect_to character_path(@character), alert: "Booking could not be created"
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
