class Request < ApplicationRecord
  enum :status, {
    pending: 'pending',
    approved: 'approved',
    rejected: 'rejected',
  }

  belongs_to :circle
  belongs_to :request_type
  belongs_to :applicant, class_name: 'User', optional: true
  belongs_to :approver, class_name: 'User', optional: true
end
