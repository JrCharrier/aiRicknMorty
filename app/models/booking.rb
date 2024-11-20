class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :character

  # Validation pour empêcher la réservation si la start_date est après la end_date
  validate :start_date_before_end_date

  # Définir le statut par défaut à "to_be_validated"
  before_create :set_default_status

  private

  def start_date_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "ne peut pas être après la date de fin")
    end
  end

  def set_default_status
    self.status ||= 'to_be_validated'  # Si status est vide, on le définit à "to_be_validated"
  end
end
