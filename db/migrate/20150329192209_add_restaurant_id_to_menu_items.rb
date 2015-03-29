class AddRestaurantIdToMenuItems < ActiveRecord::Migration
  def up
    add_column :menu_items, :restaurant_id, :integer, null: false
  end

  def down
    remove_column :menu_items, :restaurant_id
  end
end
