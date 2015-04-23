class AddLastUserLocationToUsers < ActiveRecord::Migration
  def up
    add_column :users, :last_search_location, :string
  end

  def down
    remove_column :users, :last_search_location
  end
end
