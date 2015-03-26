class AddNeighborhoodIdColumnToPostalCodes < ActiveRecord::Migration
  def up
    add_column :postal_codes, :neighborhood_id, :integer, null: false
  end

  def down
    remove_column :postal_cods, :neighborhood_id
  end
end
