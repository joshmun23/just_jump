class AddColumnToCities < ActiveRecord::Migration
  def change
    add_column :cities, :state_code_id, :integer, null: false
  end
end
