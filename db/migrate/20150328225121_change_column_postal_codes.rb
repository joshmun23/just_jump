class ChangeColumnPostalCodes < ActiveRecord::Migration
  def change
    remove_column :postal_codes, :neighborhood_id
  end
end
