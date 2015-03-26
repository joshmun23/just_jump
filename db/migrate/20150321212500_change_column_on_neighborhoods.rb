class ChangeColumnOnNeighborhoods < ActiveRecord::Migration
  def change
    remove_column :neighborhoods, :postal_code
  end
end
