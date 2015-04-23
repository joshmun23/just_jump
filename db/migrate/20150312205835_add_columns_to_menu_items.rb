class AddColumnsToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :menu_item, :string, null: false
  end
end
