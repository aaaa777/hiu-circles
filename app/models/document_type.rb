class DocumentType < ApplicationRecord
  has_many :documents
  has_many :document_excel_inputs
end
