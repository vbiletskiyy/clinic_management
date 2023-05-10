class AppointmentsController < ApplicationController
  def index
  end

  def create
    result = ::Appointments::Create.new.call(appointments_params)
    render_result(result: result, path: appointments_path, notice: "Appointment has been successfully created")
  end

  private

  def appointments_params
    params.permit(:date, :time, :doctor_id, :patient_id, :recommendation)
  end
end
