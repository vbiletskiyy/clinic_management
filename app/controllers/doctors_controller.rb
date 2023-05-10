class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @result = ::Doctors::Index.new.call(params[:specialties])
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
  end

  private

  def current_ability
    @current_ability ||= DoctorAbility.new(current_user)
  end
end
