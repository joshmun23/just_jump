class ChangeColumnTypeOnRestaurants < ActiveRecord::Migration
  def change
    change_column :restaurants, :latitude, :float
    change_column :restaurants, :latitude, :float
  end
end
