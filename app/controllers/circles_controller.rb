class CirclesController < CircleHubController
  # before_action :load_data

  def about
  end

  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
  end

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      redirect_to @circle
    else
      render :new
    end
  end

  protected

  def page_title
    {
      'index' => '団体一覧',
      'show' => '団体詳細',
      'new' => '団体新規作成',
    }[action_name] || action_name.titleize
  end

  def breadcrumbs
    if ['show', 'new'].include?(action_name)
      [
        { name: "団体一覧", url: circles_path, },
        { name: page_title, disabled: true },
      ]
    # elsif action_name == 'index'
    #   [
    #     { name: "団体一覧", disabled: true },
    #   ]
    else
      nil
    end
  end

  # def load_data
  #   @header_list = header_list
  # end

  # def store_location?
  #   true
  # end

  # def header_list
  #   [
  #     { name: "Home", type: :link, url: request.path == circles_path ? "#hero" : circles_path(id: :hero), },
  #     { name: "About", type: :link, url: request.path == circles_path ? "#about" : circles_path(id: :about), },
  #     { name: "Circles", type: :link, url: circles_path, },
  #     { name: "Dropdown", type: :dropdown, items: [
  #       { name: "Item 1", type: :link, url: "#", },
  #       { name: "Deep Dropdown", type: :dropdown, items: [
  #         { name: "Item 1", type: :link, url: "#", },
  #         { name: "Item 2", type: :link, url: "#", },
  #       ]},
  #     ]},
  #   ]
  # end

  private

  def circle_params
    params.require(:circle).permit(:name)
  end

end
