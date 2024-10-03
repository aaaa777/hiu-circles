class CircleRole < ApplicationRecord
  has_many :member_circle_role_relations
  has_many :members, through: :member_circle_role_relations
end
