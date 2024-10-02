class CreateDocumentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :document_types, id: :uuid do |t|
      t.string :name
      t.binary :template_file

      t.timestamps
    end
  end
end
