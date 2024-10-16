class AdminController < LoginRequiredAreaController
  before_action :load_admin_data

  private

  def load_admin_data
    @sidebar_left_title = sidebar_left_title
    @sidebar_left_subtitle = sidebar_left_subtitle
    @sidebar_left_items = sidebar_left_items
  end

  def sidebar_left_title
    raise NotImplementedError, "AdminControllerを継承したクラスでsidebar_left_titleメソッドを実装してください"
  end

  def sidebar_left_subtitle
    raise NotImplementedError, "AdminControllerを継承したクラスでsidebar_left_subtitleメソッドを実装してください"
  end

  def sidebar_left_items
    raise NotImplementedError, "AdminControllerを継承したクラスでsidebar_left_itemsメソッドを実装してください"
  end
end
