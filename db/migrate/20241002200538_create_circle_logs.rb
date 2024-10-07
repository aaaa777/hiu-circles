class CreateCircleLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :circle_logs do |t|
      t.references :circle, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :members }
      t.references :target_member, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
