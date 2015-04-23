class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def up
    add_column :food_searches, :latitude, :float
    add_column :food_searches, :longitude, :float
  end

  def down
    remove_column :food_searches, :latitude
    remove_column :food_searches, :longitude
  end
end
