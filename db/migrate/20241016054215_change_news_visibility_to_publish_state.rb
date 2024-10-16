class ChangeNewsVisibilityToPublishState < ActiveRecord::Migration[7.1]
  def change
    rename_column :news, :visibility, :publish_state
  end
end
