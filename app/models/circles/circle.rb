class Circle < ApplicationRecord
  string :name
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_many :members
  has_many :request_types
  has_many :abstract_requests
  has_many :enabled_request_types
end
