class CreateCountryCodes < ActiveRecord::Migration
  def change
    create_table :country_codes do |t|
      t.string :country_code, null: false, unique: true

      t.timestamps null: false
    end
  end
end
