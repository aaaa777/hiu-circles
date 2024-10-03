class ChangeMemberRoleRelationToUserRoleRelation < ActiveRecord::Migration[7.1]
  def change
    rename_table :member_role_relations, :user_role_relations
    remove_reference :user_role_relations, :member, type: :uuid, null: false, foreign_key: true
    add_reference :user_role_relations, :user, type: :uuid, null: false, foreign_key: true
  end
end
