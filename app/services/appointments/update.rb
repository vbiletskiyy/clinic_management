module Appointments
  class Update
    attr_reader :params

    def call(params)
      @params = params
      update_appointment
    end

    private

    def update_appointment
      appointment = Appointment.find_by(id: params[:id])
      if params.has_key?(:recommendation)
        appointment.update(params.merge(closed: true))
      else
        appointment.update(params)
      end
    end
  end
end
