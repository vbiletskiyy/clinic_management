class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = Doctor.all
  end

  def show
    authorize! :read, current_user
  end

  private

  def current_ability
    @current_ability ||= DoctorAbility.new(current_user)
  end
end
