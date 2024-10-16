class AddCircleAndUserToNews < ActiveRecord::Migration[7.1]
  def change
    add_reference :news, :circle, null: true, foreign_key: true
    add_reference :news, :user, null: true, foreign_key: true
  end
end
