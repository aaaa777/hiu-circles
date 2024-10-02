class ChangeAbstractRequestsToRequests < ActiveRecord::Migration[7.1]
  def change
    rename_table :abstract_requests, :requests
  end
end
