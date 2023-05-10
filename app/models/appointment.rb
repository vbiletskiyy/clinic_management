class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :date, :time, presence: true
end
