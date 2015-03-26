class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :neighborhood, null: false
      t.integer :postal_code, null: false

      t.timestamps null: false
    end
  end
end
