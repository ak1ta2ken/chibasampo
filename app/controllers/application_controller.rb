class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :profile_image, :profile_image_cache, { label_ids: [] }])
  end
  private
  def after_sign_in_path_for(resource)
    users_show_path
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
