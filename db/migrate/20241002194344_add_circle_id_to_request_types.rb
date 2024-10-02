class AddCircleIdToRequestTypes < ActiveRecord::Migration[7.1]
  def change
    add_reference :request_types, :circle, type: :uuid, null: false, foreign_key: true
  end
end
