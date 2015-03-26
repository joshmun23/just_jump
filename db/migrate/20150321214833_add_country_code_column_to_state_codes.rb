class AddCountryCodeColumnToStateCodes < ActiveRecord::Migration
  def change
    add_column :state_codes, :country_code_id, :integer, null: false
  end
end
