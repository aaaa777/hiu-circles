class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :status
      t.string :note
      
      t.references :circle, null: false, foreign_key: true
      t.references :request_type, null: false, foreign_key: true
      t.references :applicant, null: true, foreign_key: { to_table: :users }
      t.references :approver, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
