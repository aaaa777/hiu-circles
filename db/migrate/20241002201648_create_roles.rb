class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name

      t.references :circle, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
