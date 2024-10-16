class CreateNewsUserVisibilityRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :news_user_visibility_relations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :news, null: false, foreign_key: true

      t.timestamps
    end
  end
end
