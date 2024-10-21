class Hub::AdminController < AdminController
  def index
  end

  def user_settings
  end

  protected

  def sidebar_left_title
    "Hub | 設定"
  end

  def sidebar_left_subtitle
    "#{@user.last_name} #{@user.first_name}"
  end

  def sidebar_left_items
    # super + 
    [
      { name: "全体設定", type: :section },
      { name: "一般", type: :link, url: root_path, icon: "tachometer-alt" },
      { name: "通知先設定", type: :link, url: "" },

      { name: "NewsHub", type: :section },
      { name: "ニュース一覧", type: :dropdown, icon: "newspaper", items: [
        { name: "全て", url: "" },
        { name: "スター付き", url: "" },
        { name: "お気に入り", url: "" },
      ] },
      { name: "ニュース投稿", type: :link, url: "" },
      { name: "フィルター設定", type: :link, url: "" },

      { name: "CircleHub", type: :section },
      { name: "団体一覧", type: :link, icon: "users", url: circles_path },
      { name: "申請一覧", type: :dropdown, icon: "user-plus", items: [
        { name: "全て", url: "" },
        { name: "確認中の依頼", url: "" },
        { name: "承認待ち", url: "" },
      ] }
      { name: "新規団体作成", url: new_circle_path, external_link: true },

      { name: "APIHub", type: :section },
      { name: "API一覧", type: :link, icon: "code", url: wip_path },
    ]
  end
end