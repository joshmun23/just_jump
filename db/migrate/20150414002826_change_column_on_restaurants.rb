class ChangeColumnOnRestaurants < ActiveRecord::Migration
  def change
    change_column :restaurants, :longitude, :float
  end
end
