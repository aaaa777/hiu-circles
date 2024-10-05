class CircleHubDashboardController < LoginRequiredAreaController
  def index
    @circles = Circle.all
  end
end
