class ChangeEnabledRequestsToEnabledRequestTypes < ActiveRecord::Migration[7.1]
  def change
    rename_table :enabled_requests, :enabled_request_types
  end
end
