class FromUserRequestsController < LoginRequiredAreaController
  before_action :load_circle

  def index
    @request_types = FromUserRequestType.all
  end

  def new
    @user = current_user
    @request = FromUserRequest.new(request_type: @request_type)
    @request_type = FromUserRequestType.find_by(id: params[:request_type_id])
    @requests_user_has_sent = FromUserRequest.where(applicant: @user, circle: @circle, request_type: @request_type, status: "pending")
  end

  def show
    @request = FromUserRequest.find(params[:id])
  end


  # Circleの管理者or作成者が操作可能

  def create
    @request = FromUserRequest.new(request_params)
    if @request.save
      redirect_to circle_path(@circle), notice: "リクエストを送信しました"  
    else
      @request_type = @request.request_type
      redirect_to new_from_user_request_path(@circle, request_type_id: @request_type.id), alert: "リクエストを送信できませんでした"
    end
  end

  def update
    @request = FromUserRequest.find(params[:id])
  end

  def destroy
    @request = FromUserRequest.find(params[:id])
  end

  protected

  def load_circle
    @circle = Circle.find(params[:id])
  end

  def request_params
    params.require(:from_user_request).permit(:request_type_id, :note).merge(circle: @circle).merge(applicant: current_user).merge(status: "pending")
  end
  
end
