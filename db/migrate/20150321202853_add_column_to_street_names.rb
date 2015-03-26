class AddColumnToStreetNames < ActiveRecord::Migration
  def change
    add_column :street_names, :postal_code_id, :integer, null: false
  end
end
