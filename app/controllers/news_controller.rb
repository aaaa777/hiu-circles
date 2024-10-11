class NewsController < HubThemeController
  def about
  end

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  protected

  def hub_image
    "scaffold-theme/newshub-tekitou.png"
  end
end
