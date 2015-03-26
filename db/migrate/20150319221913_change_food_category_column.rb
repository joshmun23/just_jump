class ChangeFoodCategoryColumn < ActiveRecord::Migration
  def up
    change_column :food_categories, :category, :string, null: false, unique: true
  end

  def down
    change_column :food_categories, :category, :string, unique: true
  end
end
