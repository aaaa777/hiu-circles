class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def routes
    @routes = Rails.application.routes.routes
  end

  def wip
  end

  def redirect_to_root
    redirect_to home_path, host: Rails.configuration.x.domains.hiu_hub
  end
end
