class CreateStateCodes < ActiveRecord::Migration
  def change
    create_table :state_codes do |t|
      t.string :state_code, null: false, unique: true

      t.timestamps null: false
    end
  end
end
