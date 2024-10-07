class RequestType < ApplicationRecord
  enum flow_name: {
    join_circle_provisional_member: 'join_circle_provisional_member',
    join_circle_member: 'join_circle_member',
    leave_circle: 'leave_circle',
  }

  belongs_to :circle
  has_many :requests
  has_many :enabled_request_types
end
