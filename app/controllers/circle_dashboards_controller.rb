class CircleDashboardsController < DashboardController
  before_action :load_circle_data
  before_action :load_sidebar_data

  def index
  end

  def member_list
    @members = @circle.members
  end

  protected

  def load_circle_data
    @circle = current_circle
  end

  def load_sidebar_data
    @sidebar_left_title = sidebar_left_title
    @sidebar_left_subtitle = sidebar_left_subtitle
    @sidebar_left_items = sidebar_left_items
  end

  def current_circle
    Circle.find(params[:id])
  end

  def sidebar_left_title
    "Circle-Hub"
  end

  def sidebar_left_subtitle
    "#{@user.last_name} #{@user.first_name} | #{@circle.name}"
  end

  def sidebar_left_items
    [
      { name: "ダッシュボード", type: :link, url: circle_dashboard_path(@circle), icon: "fa-tachometer-alt", active: match_action?('index') },
      { name: "管理", type: :section },
      { name: "メンバー", type: :dropdown, icon: "users", items: [
        { name: "一覧", url: member_list_circle_dashboard_path(@circle), active: match_action?('member_list') },
        # { name: "役職", url: circle_roles_circle_dashboard_path(@circle) },
      ] },
      { name: "申請一覧", type: :dropdown, icon: "user-plus", items: [
        { name: "新規作成", url: '#', active: match_action?('new') },
        { name: "承認待ち", url: '#', active: match_action?('waiting') },
      ] }
    ]
  end

  private

  def match_action?(action)
    action_name == action
  end
end
