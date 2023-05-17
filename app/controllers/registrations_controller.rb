class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def new
    super do |resource|
      resource.user_hospitals.build
    end
  end 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, user_hospitals_attributes: [:role, :hospital_id]])
  end
end
