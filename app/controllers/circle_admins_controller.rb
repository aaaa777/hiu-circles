class CircleAdminsController < AdminController
  # before_action :load_circle_data
  # before_action :load_sidebar_data

  def index
  end

  def member_list
    @members = @circle.members
  end

  def member_show
  end

  def role_index
  end

  def role_new
  end

  def role_edit
  end

  def request_pending
  end

  def request_index
  end

  def notification_setting
  end

  def template_new
  end



  def activity_log
  end

  def wip
  end

  protected

  def load_circle_data
    @circle = current_circle
  end

  # def load_sidebar_data
  #   @sidebar_left_title = sidebar_left_title
  #   @sidebar_left_subtitle = sidebar_left_subtitle
  #   @sidebar_left_items = sidebar_left_items
  # end

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
      { name: "一般", type: :section }, # 一般情報
      { name: "ダッシュボード", type: :link, action: :index, icon: "fa-tachometer-alt" },
      { name: "自分の申請", type: :link, action: :wip, icon: "fa-user-plus" },
      { name: "メンバー一覧", type: :link, action: :member_list, alias: [:member_show], icon: "fa-users" },
      
      { name: "運用・管理", type: :section }, # 運用者のみが見える情報(ops)
      { name: "役職", type: :dropdown, icon: "fa-user-tag", items: [
        { name: "一覧", action: :role_index },
        { name: "追加", action: :role_new },
        { name: "編集", action: :role_edit },
      ] },
      { name: "申請", type: :dropdown, icon: "fa-user-plus", items: [
        { name: "承認待ち", action: :request_pending },
        { name: "一覧", action: :request_index },
      ] },
      { name: "申請テンプレート設定", type: :dropdown, icon: "fa-file", items: [
        { name: "新規作成", action: :wip },
        { name: "編集", action: :wip },
        { name: "一覧", action: :wip },
      ] },
      { name: "年度末書類", type: :dropdown, icon: "fa-file", items: [
        { name: "一括出力", type: :link, action: :wip, icon: "fa-file" },
      ] },
      { name: "通知設定", type: :link, action: :notification_setting, icon: "fa-bell" },
      { name: "操作ログ", type: :link, action: :activity_log, icon: "fa-history" },
      
      { name: "会計", type: :section }, # 会計担当者のみが見える情報(accounting)
      { name: "会計ダッシュボード", type: :link, action: :wip, icon: "fa-tachometer-alt" },
      
      { name: "設定", type: :section }, # サイト管理者のみが見える情報(admin)
      { name: "全体設定", type: :link, action: :wip, icon: "fa-cog" },
    ].map do |item|
      if item[:type] == :dropdown
        item[:items].map! do |sub_item|
          sub_item.merge!(active: action_name == sub_item[:action].to_s)
          sub_item.merge(url: send(sub_item[:action].to_s == 'index' ? "circle_admin_path" : "#{sub_item[:action].to_s}_circle_admin_path", @circle)) if sub_item[:url].nil? && sub_item[:action].present?
        end
        item.merge!(active: item[:items].any? { _1[:active] })
      else
        item.merge!(url: send(item[:action].to_s == 'index' ? "circle_admin_path" : "#{item[:action].to_s}_circle_admin_path", @circle)) if item[:url].nil? && item[:action].present?
        item.merge!(active: action_name == item[:action].to_s)
      end
      item
    end
  end

  private

  def match_action?(action)
    action_name == action
  end
end
