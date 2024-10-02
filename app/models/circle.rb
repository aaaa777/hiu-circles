class Circle < ApplicationRecord
  string :name
  enum status: {
    active: 'active',
    inactive: 'inactive'
  }

  has_many :members
end
