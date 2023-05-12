class PatientsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize! :read, current_user
  end

  private

  def current_ability
    @current_ability ||= PatientAbility.new(current_user)
  end
end
