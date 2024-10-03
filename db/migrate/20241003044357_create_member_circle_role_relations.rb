class CreateMemberCircleRoleRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :member_circle_role_relations, id: :uuid do |t|
      t.references :member, type: :uuid, null: false, foreign_key: true
      t.references :circle_role, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
