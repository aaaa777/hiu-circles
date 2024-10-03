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
  has_many :circle_log_authors, class_name: 'CircleLog', foreign_key: 'author_id'
  has_many :circle_log_target_members, class_name: 'CircleLog', foreign_key: 'target_member_id'
  has_many :member_circle_role_relations
  has_many :circle_roles, through: :member_circle_role_relations

  validates :circle_id, presence: true
end
