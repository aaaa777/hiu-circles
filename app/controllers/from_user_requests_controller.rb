class FromUserRequestsController < ApplicationController


  def index
    @circle = Circle.find(params[:id])
    @request_types = FromUserRequestType.all
  end

  def new
    @circle = Circle.find(params[:id])
    @request = FromUserRequest.new(request_type: @request_type)
    @request_type = FromUserRequestType.find_by(id: params[:request_type_id])
  end

  def show
    @circle = Circle.find(params[:id])
    @request = FromUserRequest.find(params[:id])
  end


  # Circleの管理者or作成者が操作可能

  def create
    @circle = Circle.find(params[:id])
    @request = FromUserRequest.new(request_params)
    debugger
    if @request.save
      redirect_to root_path, notice: "リクエストを送信しました"
    else
      @request_type = @request.request_type
      flash.now[:alert] = "リクエストの送信に失敗しました"
      render :new, params: { request_type_id: @request.request_type_id }
    end
  end

  def update
    @circle = Circle.find(params[:id])
    @request = FromUserRequest.find(params[:id])
  end

  def destroy
    @circle = Circle.find(params[:id])
    @request = FromUserRequest.find(params[:id])
  end

  protected

  def request_params
    params.require(:request).permit(:request_type_id, :name, :note).merge(circle: @circle).merge(applicant: current_user).merge(status: "pending")
  end
  
end
