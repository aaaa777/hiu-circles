class CreateAbstractRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :abstract_requests, id: :uuid do |t|
      t.string :title
      t.string :description
      t.string :type
      t.string :status
      t.string :note

      t.references :circle, type: :uuid, null: false, foreign_key: true
      t.references :applicant, type: :uuid, null: false, foreign_key: { to_table: :members }
      t.references :approver, type: :uuid, null: false, foreign_key: { to_table: :members }

      t.timestamps
    end
  end
end
