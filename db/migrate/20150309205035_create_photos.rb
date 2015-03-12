class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.timestamps null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string "photo"
      t.integer "width"
      t.integer "height"
      t.string "optimal_size"
    end
  end
end
