class AddColumnsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :phone, :string
    add_column :restaurants, :is_closed, :boolean
    add_column :restaurants, :url, :string
    add_column :restaurants, :mobile_url, :string
    add_column :restaurants, :snippet_text, :string
    add_column :restaurants, :street_number, :string
    add_column :restaurants, :latitude, :decimal
    add_column :restaurants, :longitude, :decimal
  end
end
