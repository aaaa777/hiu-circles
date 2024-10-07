class CreateMemberCircleRoleRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :member_circle_role_relations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :circle_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
