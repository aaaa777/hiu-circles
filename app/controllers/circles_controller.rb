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

  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      redirect_to @circle
    else
      render :new
    end
  end

  protected

  def store_location?
    true
  end

  private

  def circle_params
    params.require(:circle).permit(:name)
  end

end
