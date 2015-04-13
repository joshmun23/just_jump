class AddUniqueToMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :menu_item, :string, null: false, unique: true
  end
end
