class AddColumnsToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :name, :string, null: false
  end
end
