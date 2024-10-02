class News < ApplicationRecord
  string :title
  string :caption
  string :content
  string :link
  boolean :is_external
  string :visibility
end
