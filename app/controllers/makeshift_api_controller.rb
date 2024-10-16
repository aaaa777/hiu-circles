class MakeShiftApiController < ApplicationController
  def push_news
    
  end

  private

  def create_news_params
    params.permit(:title, :content)
  end
end