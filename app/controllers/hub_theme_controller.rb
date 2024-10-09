class HubThemeController < ApplicationController
  before_action :load_data

  protected

  def load_data
    @header_list = header_list
    @footer_list = footer_list
  end

  def store_location?
    true
  end

  def header_list
    [
      { name: "Circle-Hub", type: :link, url: circles_path, },
      { name: "News-Hub", type: :link, url: circles_path, },
      { name: "API-Hub", type: :link, url: circles_path, },
      *(
        user_signed_in? ?
          [
            { name: "Account", type: :dropdown, items: [
              { name: "Profile", type: :link, url: edit_user_registration_path, },
              { name: "Sign Out", type: :link, url: destroy_user_session_path, method: :delete, },
            ]},
          ]
        :
          [
            { name: "Login", type: :link, url: new_user_session_path, },
            { name: "Sign Up", type: :link, url: new_user_registration_path, }
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
end
