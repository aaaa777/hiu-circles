class CreateEnabledRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :enabled_requests, id: :uuid do |t|
      t.references :circle, type: :uuid, null: false, foreign_key: true
      t.references :request_type, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
