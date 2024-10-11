class ApplicationController < ActionController::Base
  # before_action :sign_in_required
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action  :save_redirect_to
  after_action  :store_location

  protected

  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :student_number])
  end

  # deviseのログイン後のリダイレクト先の設定
  def after_sign_in_path_for(resource)
    if session[:previous_url].present?
      session[:previous_url]
    else
      root_url
    end
  end

  def store_location
    if store_location?
      session[:previous_url] = request.url
    end
  end

  def store_location?
    false
  end

  def save_redirect_to
    if params[:redirect_to].present?
      session[:previous_url] = params[:redirect_to]
    end
  end
end
