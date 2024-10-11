class MakeshiftRedirectController < ApplicationController
  def redirect
    redirect_to sotensai_2024_path, host: "hub.nomiss.net"
  end
end