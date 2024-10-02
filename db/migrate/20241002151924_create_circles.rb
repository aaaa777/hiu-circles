class CreateCircles < ActiveRecord::Migration[7.1]
  def change
    create_table :circles do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
