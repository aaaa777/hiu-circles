class CreateCircleLogTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :circle_log_types do |t|
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
