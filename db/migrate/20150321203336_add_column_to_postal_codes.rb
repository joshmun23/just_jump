class AddColumnToPostalCodes < ActiveRecord::Migration
  def change
    add_column :postal_codes, :city_id, :integer, null: false
  end
end
