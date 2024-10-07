class CreateCircleRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :circle_roles do |t|
      t.string :name

      t.references :circle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
