class AdminController < LoginRequiredAreaController
  before_action :load_data

  private

  def load_data
    @sidebar_left_title = sidebar_left_title
    @sidebar_left_subtitle = sidebar_left_subtitle
    @sidebar_left_items = sidebar_left_items
  end

  def sidebar_left_title
    "Hub"
  end

  def sidebar_left_subtitle
    "#{@user.last_name} #{@user.first_name}"
  end

  def sidebar_left_items
    [
      { name: "ダッシュボード", type: :link, url: root_path, icon: "tachometer-alt" },
      { name: "管理", type: :section },
      { name: "メンバー", type: :dropdown, icon: "users", items: [
        { name: "一覧", url: root_path },
        # { name: "役職", url: circle_roles_circle_admin_path(@circle) },
      ] },
      { name: "申請", type: :dropdown, icon: "user-plus", items: [
        # { name: "一覧", url: new_circle_application_path(@circle) },
      ] }
    ]
  end
end
