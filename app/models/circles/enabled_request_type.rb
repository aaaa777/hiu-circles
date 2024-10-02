class EnabledRequest < ApplicationRecord
  belongs_to :circle
  belongs_to :request_type
end
