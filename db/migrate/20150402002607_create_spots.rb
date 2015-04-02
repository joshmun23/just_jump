class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.boolean :will_eat, default: false

      t.timestamps null: false
    end
  end
end
