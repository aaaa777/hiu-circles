class CircleLog < ApplicationRecord
  belongs_to :circle
  belongs_to :circle_log_type
  belongs_to :author, class_name: 'Member'
  belongs_to :target_member, class_name: 'Member', optional: true
end
