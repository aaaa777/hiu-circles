class CirclesController < CircleHubController
  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def new
    @circle = Circle.new
  end
end
