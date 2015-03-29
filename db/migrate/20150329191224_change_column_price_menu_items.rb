class ChangeColumnPriceMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :menu_item, :string
  end
end
