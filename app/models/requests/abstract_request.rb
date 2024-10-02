class AbstractRequest < ApplicationRecord
  string :title
  string :description
  enum :type, {
    pending: 'pending',
    approved: 'approved',
    rejected: 'rejected'
  }
  string :note

  belongs_to :circle
  belongs_to :applicant, class_name: 'Member', foreign_key: 'member_id'
  belongs_to :approver, class_name: 'Member', foreign_key: 'member_id'
end
