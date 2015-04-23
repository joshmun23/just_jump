class RenameStateColumnOnFoodSearches < ActiveRecord::Migration
  def up
    rename_column :food_searches, :state, :state_code
  end

  def down
    rename_column :food_searches, :state_code, :state
  end
end
