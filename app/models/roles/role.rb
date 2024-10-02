class Role < ApplicationRecord
  string :name

  has_many :role_ability_relations
  has_many :abilities, through: :role_ability_relations
end
