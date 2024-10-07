class CreateSiteRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :site_roles do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
