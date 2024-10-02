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

  validates :circle_id, presence: true
end
