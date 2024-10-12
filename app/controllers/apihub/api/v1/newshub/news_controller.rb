class Apihub::Api::V1::System::NewsController < ApiHub::Api::AuthorizationController
  def list
  end

  def create
    @receiving_news = ReceivingNews.new(receiving_news_params)
    if @receiving_news.save
      redirect_to @receiving_news
    else
      render :new
    end
  end

  private

  def receiving_news_params
    params.require(:receiving_news).permit(:user_id, :news_id)
  end

  def filter_params
    params.permit(:user_id, :news_id)
  end
end