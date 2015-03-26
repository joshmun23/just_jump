class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.string :postal_code, null: false, unique: true

      t.timestamps null: false
    end
  end
end
