class RequestType < ApplicationRecord
  enum flow_name: {
    join_circle_provisional_member: 'join_circle_provisional_member',
    join_circle_member: 'join_circle_member',
    leave_circle: 'leave_circle',
  }

  belongs_to :circle
  has_many :requests
  has_many :enabled_request_types

  def from_user_request_type
    FromUserRequestType.find_by(id: id)
  end

  def from_admin_request_type
    FromAdminRequestType.find_by(id: id)
  end
end
