class AddZipCodeToFoodSearches < ActiveRecord::Migration
  def up
    add_column :food_searches, :zipcode, :string
  end
  def down
    remove_column :food_searches, :zipcode
  end
end
