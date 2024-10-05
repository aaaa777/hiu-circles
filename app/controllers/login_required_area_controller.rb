class LoginRequiredAreaController < ApplicationController

  before_action :sign_in_required

  private

  def is_public_page?
    false
  end

  def sign_in_required
    return if user_signed_in? || is_public_page? || devise_controller?
    redirect_to new_user_session_url
  end
end
