class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.binary :file

      t.references :circle, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
