class ChangeColumnMenuItems < ActiveRecord::Migration
  def change
    rename_column :menu_item, :name, :menu_items
  end
end
