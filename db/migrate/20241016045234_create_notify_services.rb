class CreateNotifyServices < ActiveRecord::Migration[7.1]
  def change
    create_table :notify_services do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
