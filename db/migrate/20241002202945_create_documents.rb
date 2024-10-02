class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents, id: :uuid do |t|
      t.string :name
      t.binary :file

      t.references :circle, type: :uuid, null: false, foreign_key: true
      t.references :document_type, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
