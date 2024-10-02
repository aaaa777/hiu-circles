class CreateDocumentExcelInputs < ActiveRecord::Migration[7.1]
  def change
    create_table :document_excel_inputs, id: :uuid do |t|
      t.integer :col_index
      t.integer :row_index
      t.string :value

      t.references :document, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
