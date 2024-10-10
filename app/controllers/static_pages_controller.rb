class StaticPagesController < HubThemeController
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
    redirect_to home_path
  end

  def redirect_to_about_circle_root
    redirect_to about_circles_path
  end
end
