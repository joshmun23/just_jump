class RenameRMJoinTable < ActiveRecord::Migration
  def change
    rename_table :menu_items_restaurants, :restaurant_menu_items
  end
end
