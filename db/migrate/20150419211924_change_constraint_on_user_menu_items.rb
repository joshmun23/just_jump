class ChangeConstraintOnUserMenuItems < ActiveRecord::Migration
  def change
    remove_index :user_menu_items, ['user_id', 'menu_item_id']
  end
end
