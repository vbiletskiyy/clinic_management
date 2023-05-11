module Appointments
  class Index
    include UserHelper
    attr_reader :current_user

    def call(current_user)
      @current_user = current_user
      set_appointments
    end

    private

    def set_appointments
      return Appointment.includes(:patient).where(doctor_id: current_user.id, closed: false) if doctor?(current_user)
      return Appointment.includes(:doctor).where(patient_id: current_user.id) if patient?(current_user)
    end
  end
end
