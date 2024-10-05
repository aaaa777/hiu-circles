class DashboardController < ApplicationController
  def index
    @circles = Circle.all
  end
end
