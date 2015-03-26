class CreateStreetNames < ActiveRecord::Migration
  def change
    create_table :street_names do |t|
      t.string :street_name, null: false
      t.timestamps null: false
    end
  end
end
