class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = ::Appointments::Index.new.call(current_user)
  end

  def create
    result = ::Appointments::Create.new.call(appointments_params)
    render_result(result: result, path: appointments_path, notice: "Appointment has been successfully created")
  end

  def update
    result = ::Appointments::Update.new.call(appointments_params)
    render_result(result: result, path: appointments_path, notice: "Appointment has been successfully updated")
  end

  private

  def appointments_params
    params.permit(:date, :time, :doctor_id, :patient_id, :recommendation, :id)
  end
end
