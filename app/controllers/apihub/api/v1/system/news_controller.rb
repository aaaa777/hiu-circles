class Apihub::Api::V1::System::NewsController < Apihub::Api::SystemController
  def create
    @news = News.new(create_params)
    if @news.save
      render **response_ok
    else
      render **response_error(message: @news.errors.full_messages.join("\n"))
    end
  end

  private

  def receiving_news_params
    params.require(:receiving_news).permit(:user_id, :news_id)
  end

  def create_params
    params.require(:title).permit(:content, :link, :is_external, :visibility)
  end
end