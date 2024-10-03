class Document < ApplicationRecord
  belongs_to :circle
  belongs_to :document_type
end
