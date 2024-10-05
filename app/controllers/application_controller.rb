class ApplicationController < ActionController::Base
  # before_action :sign_in_required

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :student_number])
  end

  # deviseのログイン後のリダイレクト先の設定
  def after_sign_in_path_for(resource)
    # user_path(current_user)
    circles_path
  end

  # private
  
  # def is_public_page?
  #   false
  # end

  # def sign_in_required
  #   return if user_signed_in? || is_public_page? || devise_controller?
  #   redirect_to new_user_session_url
  # end
end
