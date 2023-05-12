module Appointments
  class Create
    def call(params)
      @params = params
      create_appointment
    end

    def create_appointment
      appointment = Appointment.new(@params)
      appointment.save
      appointment
    end
  end
end
