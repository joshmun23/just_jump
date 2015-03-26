class CreateFoodCategories < ActiveRecord::Migration
  def change
    create_table :food_categories do |t|
      t.string :category, unique: true

      t.timestamps null: false
    end
  end
end
