class RequestType < ApplicationRecord
  string :title
  string :description

  belongs_to :circle
  has_many :abstract_requests
  has_many :enabled_request_types
end
