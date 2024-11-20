class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :authenticate_user!, except: :home

  def home
  end

  def dashboard
    @my_bookings = current_user.bookings
                            .includes(:character)
                            .order(
                              Arel.sql("CASE
                                WHEN status = 'to_be_validated' THEN 1
                                WHEN status = 'approved' THEN 2
                                WHEN status = 'declined' THEN 3
                                ELSE 4
                              END"),
                              :start_date
                            )

    @my_characters = current_user.characters
    @to_be_validated = Booking.joins(:character).where(characters: { user_id: current_user.id }, status: "to_be_validated")
  end

  def approve_booking
    booking = Booking.find(params[:id])
    if booking.update(status: 'approved')
      redirect_to dashboard_path, notice: 'Réservation approuvée.'
    else
      redirect_to dashboard_path, alert: 'Erreur lors de l\'approbation de la réservation.'
    end
  end

  def decline_booking
    booking = Booking.find(params[:id])
    if booking.update(status: 'declined')
      redirect_to dashboard_path, notice: 'Réservation refusée.'
    else
      redirect_to dashboard_path, alert: 'Erreur lors du refus de la réservation.'
    end
  end
end
