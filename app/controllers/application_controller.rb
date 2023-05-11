class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back(fallback_location: root_path, flash: { error: exception.message }) 
  end


  def render_result(result:, path:, notice: nil)
    if result
      redirect_to path, notice: notice
    else
      @errors = result.errors.full_messages
      render turbo_stream: turbo_stream.update("validation_messages", partial: "shared/errors")
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :phone_number, :type, :password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a? Doctor
      doctor_path(current_user)
    elsif resource.is_a? Patient
      patient_profile_path
    else
      super
    end
  end
end
