class MakeshiftRedirectController < ApplicationController
  def redirect
    redirect_to root_path, host: "hub.nomiss.net"
  end
end