class FromAdminRequest < Request

  def from_user_request_type
    FromUserRequestType.find_by(id: request_type.id)
  end
end