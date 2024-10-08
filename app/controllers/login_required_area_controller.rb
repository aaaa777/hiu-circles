class LoginRequiredAreaController < ApplicationController

  # before_action :sign_in_required
  before_action :load_user_data
  before_action :check_login

  protected

  def store_location?
    true
  end

  private

  def load_user_data
    @user = current_user
  end

  def is_public_page?
    false
  end

  def check_login
    if user_signed_in?
      return
    end
    if is_public_page?
      return
    end
    redirect_to new_user_session_url
  end
end
