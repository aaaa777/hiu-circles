class LoginRequiredAreaController < ApplicationController

  # before_action :sign_in_required
  before_action :load_user_data

  private

  def load_user_data
    @user = current_user
  end

  def is_public_page?
    false
  end

  # def sign_in_required
  #   return if user_signed_in? || is_public_page? || devise_controller?
  #   redirect_to new_user_session_url
  # end
end
