class AddIndexesOnRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :street_name_id, :integer, null: false
    add_column :restaurants, :postal_code_id, :integer, null: false
  end
end
