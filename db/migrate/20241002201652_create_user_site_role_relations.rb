class CreateUserSiteRoleRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_site_role_relations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :site_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
