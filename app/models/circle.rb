class Circle < ApplicationRecord
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_many :members
  has_many :request_types
  has_many :requests
  has_many :enabled_request_types
end
