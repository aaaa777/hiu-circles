class CreateCircleRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :circle_roles, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
