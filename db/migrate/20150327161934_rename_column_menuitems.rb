class RenameColumnMenuitems < ActiveRecord::Migration
  def change
    rename_column :menu_items, :menu_items, :menu_item
  end
end
