class CreateUserNotifyServicesRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_notify_services_relations do |t|
      t.string :priority

      t.references :user, null: false, foreign_key: true
      t.references :notify_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
