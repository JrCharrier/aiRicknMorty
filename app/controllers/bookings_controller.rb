class BookingsController < ApplicationController
  before_action :set_character

  def create
    booking_date = params[:booking][:start_date]
    # split booking date first (start date), second (end date)
    range_date = booking_date.split('to')
    start_date = range_date[0]
    end_date = range_date[1]

    @booking = @character.bookings.new(start_date: start_date, end_date: end_date)
    @booking.user = current_user

    if @booking.save
      # if @character.available?(params[:booking][:start_date], params[:booking][:end_date]) && @booking.save
      respond_to do |format|
        format.html { redirect_to character_path(@character), notice: "Booking successfully created" }
        format.json { render json: { message: 'Réservation réussie !' }, status: :created }
      end
    else
      respond_to do |format|
        format.html { redirect_to character_path(@character), alert: "Booking could not be created: #{@booking.errors.full_messages.join(', ')}" }
        format.json { render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date)
  end
end
