class AddLocationColumnsToFoodSearches < ActiveRecord::Migration
  def up
    add_column :food_searches, :city, :string
    add_column :food_searches, :state, :string
  end

  def down
    remove_column :food_searches, :city
    remove_column :food_searches, :state
  end
end
