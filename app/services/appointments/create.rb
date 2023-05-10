module Appointments
  class Create
    def call(params)
      @params = params
      create_appointment
    end

    def create_appointment
      Appointment.create(@params)
    end
  end
end
