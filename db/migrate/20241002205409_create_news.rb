class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news, id: :uuid do |t|
      t.string :title
      t.string :caption
      t.string :content
      t.string :link
      t.boolean :is_external
      t.string :visibility
      t.string :type

      t.timestamps
    end
  end
end
