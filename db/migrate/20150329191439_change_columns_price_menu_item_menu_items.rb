class ChangeColumnsPriceMenuItemMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :price, :string
  end
end
