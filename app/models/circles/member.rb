class Member < ApplicationRecord
  enum status: {
    pending_to_join: 'pending_to_join',
    canceled_to_join: 'canceled_to_join',
    provisionally_joined: 'provisionally_joined',
    joined: 'joined',
    left: 'left',
    other: 'other'
  }

  belongs_to :user
  belongs_to :circle
  has_many :abstract_request_applicants, class_name: 'AbstractRequest', foreign_key: 'applicant_id'
  has_many :abstract_request_approvers, class_name: 'AbstractRequest', foreign_key: 'approver_id'

  validates :circle_id, presence: true
end
