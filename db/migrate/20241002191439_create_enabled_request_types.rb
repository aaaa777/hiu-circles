class CreateEnabledRequestTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :enabled_request_types do |t|
      t.references :circle, null: false, foreign_key: true
      t.references :request_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
