class AddLocalityToRestaurant < ActiveRecord::Migration
  def up
    add_column :restaurants, :locality, :string
  end

  def down
    remove_column :restaurants, :locality
  end
end
