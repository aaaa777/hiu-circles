class AbstractRequest < ApplicationRecord
  enum :status, {
    pending: 'pending',
    approved: 'approved',
    rejected: 'rejected',
  }
  string :note

  belongs_to :circle
  belongs_to :request_type
  belongs_to :applicant, class_name: 'Member'
  belongs_to :approver, class_name: 'Member'
end
