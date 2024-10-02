class CreateRequestTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :request_types, id: :uuid do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
