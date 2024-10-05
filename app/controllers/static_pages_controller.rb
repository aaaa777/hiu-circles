class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def routes
    @routes = Rails.application.routes.routes
  end
end
