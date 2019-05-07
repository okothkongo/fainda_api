# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone_number first_name last_name])
  end
  include Response
end
