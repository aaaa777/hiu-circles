class Circle < ApplicationRecord
  string :name
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }
  timestamps

  has_many :members
end
