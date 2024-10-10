class HubThemeController < ApplicationController
  before_action :load_data

  protected

  def load_data
    @page_title = page_title
    @header_list = header_list
    @footer_list = footer_list
    @breadcrumbs = breadcrumbs
  end

  def store_location?
    true
  end

  def page_title
    action_name.titleize
  end

  def header_list
    [
      { name: "ホーム", type: :link, url: about_circles_path, },
      { name: "Circle-Hub", type: :link, url: circles_path, },
      { name: "News-Hub", type: :link, url: circles_path, },
      { name: "API-Hub", type: :link, url: circles_path, },
      *(
        user_signed_in? ?
          [
            { name: "アカウント", type: :dropdown, items: [
              { name: "プロフィール", type: :link, url: edit_user_registration_path, },
              { name: "自分の所属団体", type: :link, url: circles_path, },
              { name: "ログアウト", type: :link, url: destroy_user_session_path, method: :delete, },
            ]},
          ]
        :
          [
            { name: "ログイン", type: :link, url: new_user_session_path, },
            { name: "新規登録", type: :link, url: new_user_registration_path, style: "btn btn-primary", },
          ]
      ),
      # { name: "Login", type: :dropdown, items: [
      #   { name: "Item 1", type: :link, url: "#", },
      #   { name: "Deep Dropdown", type: :dropdown, items: [
      #     { name: "Item 1", type: :link, url: "#", },
      #     { name: "Item 2", type: :link, url: "#", },
      #   ]},
      # ]},
    ]
  end

  def footer_list
    [
      { name: "Circle-Hub", type: :dropdown, items: [
        { name: "About", type: :link, url: circles_path, },
        { name: "Contact", type: :link, url: circles_path, },
      ]},
      { name: "News-Hub", type: :dropdown, items: [
        { name: "About", type: :link, url: circles_path, },
        { name: "Contact", type: :link, url: circles_path, },
      ]},
      { name: "API-Hub", type: :dropdown, items: [
        { name: "About", type: :link, url: circles_path, },
        { name: "Contact", type: :link, url: circles_path, },
      ]},
      { name: "About us", type: :dropdown, items: [
        { name: "About", type: :link, url: circles_path, },
        { name: "Contact", type: :link, url: circles_path, },
      ]},
    ]
  end

  def breadcrumbs
    nil
  end
end
