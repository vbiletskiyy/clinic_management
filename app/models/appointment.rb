class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :date, :time, presence: true
  validate :doctor_appointments_limit, on: :create

  private

  def doctor_appointments_limit
    if doctor.appointments.where(closed: nil).count >= 10
      errors.add(:doctor, "can't have more than 10 appointments")
    end
  end
end
