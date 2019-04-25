class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
  end
end
