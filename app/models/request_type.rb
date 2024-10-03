class RequestType < ApplicationRecord
  belongs_to :circle
  has_many :requests
  has_many :enabled_request_types
end
