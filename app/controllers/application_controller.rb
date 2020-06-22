class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :image, :phone, :zipcode, :address1, :address2, :deleted_at, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :image, :phone, :zipcode, :address1, :address2, :deleted_at, :user_type])
  end
end
