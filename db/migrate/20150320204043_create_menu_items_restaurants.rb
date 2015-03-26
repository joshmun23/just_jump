class CreateMenuItemsRestaurants < ActiveRecord::Migration
  def change
    create_table :menu_items_restaurants do |t|
      t.integer :menu_item_id, null: false
      t.integer :restaurant_id, null: false
      t.index [:menu_item_id, :restaurant_id], unique: true

      t.timestamps null: false
    end
  end
end
