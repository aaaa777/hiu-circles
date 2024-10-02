class CreateCircleLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :circle_logs, id: :uuid do |t|
      t.references :circle, type: :uuid, null: false, foreign_key: true
      t.references :author, type: :uuid, null: false, foreign_key: { to_table: :members }
      t.references :target_member, type: :uuid, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
