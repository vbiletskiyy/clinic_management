class DoctorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @result = ::Doctors::Index.new.call(params[:specialties])
    @pagy, @doctors = pagy(@result[:doctors])
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
  end

  private

  def current_ability
    @current_ability ||= DoctorAbility.new(current_user)
  end
end
