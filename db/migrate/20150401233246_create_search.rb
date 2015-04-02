class CreateSearch < ActiveRecord::Migration
  def change
    create_table :food_searches do |t|
      t.string :search_term, null: false
      t.string :search_location, null: false
      t.integer :total_search_count, default: 0, null: false

      t.timestamps null:false
    end

    add_index :food_searches, [:search_term, :search_location], unique: true
  end
end
