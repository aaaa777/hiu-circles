class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members, id: :uuid do |t|
      t.string :status
      t.references :circle, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
