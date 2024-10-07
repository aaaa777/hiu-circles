class CreateRequestTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :request_types do |t|
      t.string :title
      t.string :description
      # add_reference :request_types, :circle, null: false, foreign_key: true
      t.references :circle, null: false, foreign_key: true
      t.timestamps
    end
  end
end
