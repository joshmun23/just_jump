class ChangeColumnsPriceMenuItemMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :menu_item, :string, null: false
    change_column :menu_items, :price, :string
  end
end
