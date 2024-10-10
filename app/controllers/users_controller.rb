class UsersController < AdminController


  def show
    @user = User.find(params[:id])
  end
  
  protected

  def sidebar_left_title
    "Hub | 設定"
  end

  def sidebar_left_subtitle
    "#{@user.last_name} #{@user.first_name}"
  end

  def sidebar_left_items
    [
      { name: "全体設定", type: :section },
      { name: "一般", type: :link, url: root_path, icon: "tachometer-alt" },
      { name: "通知設定", type: :link, url: "" },

      { name: "CircleHub", type: :section },
      { name: "所属団体", type: :dropdown, icon: "users", items: [
        { name: "一覧", url: root_path },
        
      ] },
      { name: "申請", type: :dropdown, icon: "user-plus", items: [
        { name: "一覧", url: "" },
        { name: "承認待ち", url: "" },
      ] }
    ]
  end
end
