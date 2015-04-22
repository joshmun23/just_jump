class CreateUserMenuItems < ActiveRecord::Migration
  def change
    create_table :user_menu_items do |t|
      t.integer :user_id, null: false
      t.string :menu_item_id, null: false

      t.timestamps null: false
    end
    add_index :user_menu_items, [:user_id, :menu_item_id], unique: true
  end
end
