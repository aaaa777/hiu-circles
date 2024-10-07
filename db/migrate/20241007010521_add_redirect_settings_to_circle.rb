class AddRedirectSettingsToCircle < ActiveRecord::Migration[7.1]
  def change
    add_column :circles, :front_page_redirect_url, :string
  end
end
