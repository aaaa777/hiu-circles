class StaticPagesController < HubThemeController
  def home
  end

  def help
  end

  def q_and_a
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

  protected

  def page_title
    {
      'home' => 'ホーム',
      'help' => 'ヘルプ',
      'q_and_a' => 'よくある質問',
      'wip' => 'WIP',
    }[action_name] || action_name.titleize
  end

  def breadcrumbs
    if ['help', 'q_and_a', 'wip'].include?(action_name)
      [
        { name: "ホーム", url: root_path, },
        { name: page_title, disabled: true },
      ]
    else
      nil
    end
  end
end
